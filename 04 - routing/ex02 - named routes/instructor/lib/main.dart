import 'package:flutter/material.dart';

/* 
  Our goal: instead of having components directly aware of one another,
            we want to centralise routing responsibility to some logic layer
            or top-level component.import
*/
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Placeholder()
    );
  }
}
