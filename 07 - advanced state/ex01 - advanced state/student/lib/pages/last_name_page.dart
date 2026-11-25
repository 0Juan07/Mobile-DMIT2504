import 'package:flutter/material.dart';

import '../models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Last Name Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            ListenableBuilder(
              listenable: user, // The class instance that holds your data is exteneded from ChangeNotifier fires notify
              builder: (BuildContext context, Widget? child) =>
                  Text('User name: ${user.firstName} ${user.lastName}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user last name here
        onPressed: () {
          user.lastName = 'Testing';
          //noop;
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
