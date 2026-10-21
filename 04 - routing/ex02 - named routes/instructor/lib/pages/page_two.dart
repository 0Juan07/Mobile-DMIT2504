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
              // same as before. to go back, we just pop most recent route off stack; don't need to know what it was exactly
              Navigator.of(context).pop();
            },
            child: const Text('Go back to Page One'),
          ),

        ],
      ),
    );
  }

}