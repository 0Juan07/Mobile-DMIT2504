import 'package:flutter/material.dart';

import 'package:nested_navigation/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("homepage")),
      body: const Center(child: Text("This is a homepage if you even care")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(nestedPathRoute);
        },
        child: const Icon(Icons.art_track_sharp),
      ),
    );
  }
}
