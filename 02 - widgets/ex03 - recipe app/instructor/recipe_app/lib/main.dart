import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Column(
          children: [
            const Text(
              'My Recipe App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )
            ),
          ],
        ),
      ),
    );
  }
}

