import 'package:flutter/material.dart';


class PageOne extends StatefulWidget {

  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();

}



class _PageOneState extends State<PageOne> {

  late String data = ''; // this is a stateful value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          const Text("Page One"),

          ElevatedButton(
            onPressed: () async {
              // General idea: I can return data from where I'm routing to, capture it here, have it ready when user comes back.
              // An enormous amount of engineering/building for mobile involves making data/UI ready ahead of time in order to make the experience
              // feel as instant/snappy as possible.
              String returnData = await Navigator.of(context)
                .pushNamed('/page-two') as String; // the data I'm expecting to be returned back is a string

              setState(() { data = returnData; });
            },
            child: const Text('Please select your excuse for why you showed up to class with underwear on your head.'),
          ),

          data != '' ? Text('Received data:\n$data') : const Text("Have not asked for data yet."),

        ],
      ),
    );
  }

}