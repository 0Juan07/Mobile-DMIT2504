import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  static const excuses = [
    'I thought it was tomorrow',
    'I thought it was yesterday',
    'my cat eat it',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Text("Page Two"),

          for (final excuse in excuses)
            ListTile(
              title: Text(excuse),
              onTap: () => Navigator.of(context).pop(excuse),
            ),
        ],
      ),
    );
  }
}
