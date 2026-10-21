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
              print("set me up with better routing!");
            },
            child: const Text('Go to Page Two'),
          ),

        ],
      ),
    );
  }

}