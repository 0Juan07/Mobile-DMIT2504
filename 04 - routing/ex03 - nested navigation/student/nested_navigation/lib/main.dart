import 'package:flutter/material.dart';

import 'routes.dart';
import 'pages/home_page.dart';
import 'pages/nested_path/nested_page_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case homeRoute:
            page = const HomePage();
            break;
          case nestedPathRoute:
            page = const NestedPageManager();
            break;
          default:
            throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) => page,
          settings: settings,
        );
      },
    );
  }
}
