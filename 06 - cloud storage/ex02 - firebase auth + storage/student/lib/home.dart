import 'app_state.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.appState, super.key});

  final ApplicationState
  appState; // I need to import and use the auth listener class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth Demo')),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 16.0),
          ListenableBuilder(
            listenable: appState,
            builder: (context, child) {
              return appState.loggedIn
                  ? Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/profile'),
                          child: const Text('Profile'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/todos'),
                          child: const Text('Todo List'),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/sign-in'),
                      child: const Text('Sign In'),
                    );
            },
          ),
        ],
      ),
    );
  }
}
