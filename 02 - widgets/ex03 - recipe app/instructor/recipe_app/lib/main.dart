import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const headingStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // like a flexbox!
                              // .stretch alignment means children fill the entire width
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: const Text(
                'My Recipe App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            Image.asset(
              'assets/images/cool.jpg',
              height: 480,
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // default x-axis align will be centering
                children: [
                  Text(
                    'Ingredients',
                    textAlign: TextAlign.center,
                    style: headingStyle,
                  ),
                  Text('- some ingredient'),
                  Text('- some ingredient'),
                  Text('- some ingredient'),
                  Text('- some ingredient'),
                  Text('- some ingredient'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // default x-axis align will be centering
                children: [
                  Text('Instructions',
                    textAlign: TextAlign.center,
                    style: headingStyle,
                  ),
                  Text('1. take your cream and behold it'),
                  Text('2. whip it good'),
                  Text('3. dip a strawberry'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// I notice that the Ingredients & Instructions 'shapes' are identical,
// so I can make one component to reuse for both those purposes.
class ListWithHeading extends StatelessWidget {
  // 1. I need a constructor (input params: super.key, heading, and list<str>)
  const ListWithHeading({
    super.key,
    required this.heading,
    required this.listItems,
  });

  // 2. I need class attributes for heading & items
  final String       heading;
  final List<String> listItems;

  // 3. I need to write a build method that returns that group of elements
}
