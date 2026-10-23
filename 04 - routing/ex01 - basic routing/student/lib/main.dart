import 'package:flutter/material.dart';
import 'package:week_05_navigator/pages/page_one.dart';

/*

  Our goal is get rid of yucky tightly coupled routing
  Components should be able to route to one another without knowing about each other
  This means that a centralized logic layer or top level component would handle routing between components


*/

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: PageOne(),
        ),
      ),
    );
  }
}
