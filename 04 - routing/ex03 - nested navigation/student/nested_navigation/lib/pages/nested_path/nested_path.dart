import 'package:flutter/material.dart';

import 'routes.dart';

class NestedPathPage extends StatelessWidget {
  const NestedPathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Somthn'),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(nestedPathOne),
              child: const Text("Nested page One"),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(nestedPathTwo),
              child: const Text("Nested page Two"),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(nestedPathThree),
              child: const Text("Nested page Three"),
            ),
          ],
        ),
      ),
    );
  }
}
