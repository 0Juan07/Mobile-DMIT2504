import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  late String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text("Page 1"),
          ElevatedButton(
              onPressed: () async {
                String returnData = await (Navigator.of(context)
                    .pushNamed('/page-two') as String);
                setState(() {
                  data = returnData;
                });
              },
              child: const Text("Go back to Page 2")),
          data != ''
              ? Text('Received $data')
              : const Text('Still waiting for algooo eejejej'),
        ],
      ),
    );
  }
}
