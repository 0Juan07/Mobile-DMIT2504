import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

///TODO: create a stateful widget, override initState to fetch the initial
/// dog url. NOTE: will need to ensure a callback is used to be certain the
/// widget has been mounted before calling setState().


Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RandomDogImage(),
        ),
      ),
    );
  }
}

// skeleton of ingredients for a stateful widget/component
// (yes, way more annoying to set up than in React)

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}


class _RandomDogImageState extends State<RandomDogImage> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}


//   static Future<String> getRandomDogUrl() async {
//     const dogEndpoint = 'https://dog.ceo/api/breeds/image/random';
//     var response = await get(Uri.parse(dogEndpoint));
//     return await jsonDecode(response.body)['message'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Image.network();
//   }
// }
