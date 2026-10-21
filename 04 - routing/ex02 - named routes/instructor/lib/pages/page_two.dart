import 'package:flutter/material.dart';


class PageTwo extends StatelessWidget {

  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          const Text("Page Two"),

          ElevatedButton(
            onPressed: () {
              print("set me up with better routing!");
            },
            child: const Text('Go back to Page One'),
          ),

        ],
      ),
    );
  }

}