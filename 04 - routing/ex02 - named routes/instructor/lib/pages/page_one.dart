import 'package:flutter/material.dart';


class PageOne extends StatelessWidget {

  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          const Text("Page One"),

          ElevatedButton(
            onPressed: () {
              // PageOne and PageTwo don't know about each other anymore, but they DO know
              // 'about' each others' string identifiers. Referencing things by ID is often good enough.
              Navigator.of(context).pushNamed('/page-two');
            },
            child: const Text('Go to Page Two'),
          ),

        ],
      ),
    );
  }

}