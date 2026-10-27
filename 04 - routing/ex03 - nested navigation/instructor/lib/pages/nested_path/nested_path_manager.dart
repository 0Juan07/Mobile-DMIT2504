import 'package:flutter/material.dart';

import 'routes.dart';
import 'nested_path.dart';
import 'nested_page_one.dart';
import 'nested_page_two.dart';
import 'nested_page_three.dart';


// this is going to be our route manager *for this subpath/submodule*
// nested routing means that for submodules of an application, they can handle their own internal routing
// and that subpath can just be generally routed to from the top-level app.
class NestedPathManager extends StatefulWidget{

  const NestedPathManager({super.key});

  @override
  State<NestedPathManager> createState() => _NestedPathManagerState();

}


class _NestedPathManagerState extends State<NestedPathManager> {

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // Navigator instance gets its own unique key to distinguish it from global/other navigators
    return Scaffold(
      appBar: AppBar(title: const Text("Some Nested Area of the App")),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: nestedPathHome, // use name of route, not name of widget
        onGenerateRoute: _onGenerateRoute,
      )
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    return null; // broken, just to have skeleton
  }

}