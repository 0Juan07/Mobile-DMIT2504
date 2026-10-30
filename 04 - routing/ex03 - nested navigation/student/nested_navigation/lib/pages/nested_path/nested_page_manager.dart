import 'package:flutter/material.dart';

import 'routes.dart';
import 'nested_path.dart';
import 'nested_page_one.dart';
import 'nested_page_two.dart';
import 'nested_page_three.dart';

class NestedPageManager extends StatefulWidget {
  const NestedPageManager({super.key});

  @override
  State<NestedPageManager> createState() => _NestedPageManagerState();
}

class _NestedPageManagerState extends State<NestedPageManager> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Some ensted area of the app")),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: nestedPathHome,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case nestedPathHome:
        page = const NestedPathPage();
        break;
      case nestedPathOne:
        page = const NestedPageOne();
        break;
      case nestedPathTwo:
        page = const NestedPageTwo();
        break;
      case nestedPathThree:
        page = const NestedPageThree();
        break;
      default:
        throw Exception('Unknown nested path ');
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) => page,
      settings: settings,
    );
  }
}
