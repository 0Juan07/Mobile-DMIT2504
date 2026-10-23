import 'package:flutter/material.dart';

import "routes.dart";
import "pages/home_page.dart";


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        /* OK, but didn't you basically just replace '/' with a middleman variable?

           Yes, here's what we get out of this:
             - cleaner separation/naming (e.g. URL route might not be a good description of waht's going on)
             - a typo becomes a compiler error *not* a runtime/pathing error
             - dynamic construction of routes gets a lot easier
        */
        homeRoute: (context) => const HomePage(),
      }
    );
  }
}
