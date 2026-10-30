import 'dart:io'; // for i/o with terminal and/or files
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:path_provider/path_provider.dart'; // will have to 'flutter pub add path_provider'

/*

  Local file
  
  path_provider  plugin
  easier for us to interact with filesystems

  Some abstractions
  - getTemporaryDirectory()               -- temp dir for temporary files
  - getApplicationDocumentsDirectory()    -- Internal app 
  - getApplicationSupportDirectory()      -- Not meant for user (kind of like AppData folders)
  - getDownloadsDirectory()               -- Guess lol



*/

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String dogImageUrl = '';
  int likes = 0;
  int dislikes = 0;

  static Future<String> getRandomDogUrl() async {
    const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
    var response = await get(Uri.parse(dogEndpoint));
    return await jsonDecode(response.body)['message'];
  }

  Future<void> _loadInitialDog() async {
    final file = await _dogFile();
    if (await file.exists()) {
      setState(() {
        dogImageUrl = file.path;
      });
    } else {
      final url = await getRandomDogUrl();
      setState(() {
        dogImageUrl = url;
      });
    }
  }

  Future<File> _dogFile() async {
    final tempDir = await getTemporaryDirectory();
    return File(
        '${tempDir.path}/dog.jpg'); // Assumes we are saving some dog image as 'dog.jpg'
  }

  Future<void> _saveDogImage(String url) async {
    final response = await get(Uri.parse(url));
    final file = await _dogFile(); // create empty
    await file.writeAsBytes(response.bodyBytes);
    debugPrint('Saved dog pic to ${file.path}');
  }

  @override
  void initState() {
    super.initState();
    _loadInitialDog(); // initial state is cleaaan
  }

  Widget _buildDogImage() {
    Widget childWidget;

    if (dogImageUrl != '') {
      dogImageUrl.startsWith('http')
          ? childWidget = Image.network(dogImageUrl)
          : childWidget = Image.file(File(dogImageUrl));
      // when doing  Image.file you have to pass the actual file
    } else {
      childWidget = const CircularProgressIndicator();
    }

    return GestureDetector(
      onTap: () {
        getRandomDogUrl().then((url) {
          _setDogImageUrl(url, true);
        });
      },
      onLongPress: () {
        getRandomDogUrl().then((url) {
          _setDogImageUrl(url, false);
        });
      },
      child: childWidget,
    );
  }

  void _setDogImageUrl(String url, bool liked) {
    setState(() {
      dogImageUrl = url;
      if (liked) {
        likes += 1;
      } else {
        dislikes += 1;
      }
      _saveDogImage(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildDogImage(),
        LikeText(like: true, number: likes),
        LikeText(like: false, number: dislikes),
      ],
    );
  }
}

class LikeText extends StatelessWidget {
  /// true to render "Likes: " and false to render "Dislikes: "
  final bool like;
  final int number;

  const LikeText({this.like = true, this.number = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            like ? "Likes: " : "Dislikes: ",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$number',
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
