import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text("Page 2"),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop("Here is some cool stuff from page 2 WhAaaAaat?");
                // pages are stack: FIFO
                // if we want to go to the previous route we just pop out the most recent browse stack

                // tl;dr holds the stack of routing history, push adds to the stack, pop just removes the last
              },
              child: const Text("Go back to Page 1"))
        ],
      ),
    );
  }
}
