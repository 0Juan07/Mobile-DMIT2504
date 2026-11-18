import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';


  // it is a fluttter built-in
  // it allows us to *listen* certain changes in state, rather than having to manually fire behaviour every time we manually change state
  // it's roughly similar to how JS event listeners work or push notifications 
class ApplicationState extends ChangeNotifier {

ApplicationState() { // simple constructor firing the base class's init method
    init(); // a constructor cannot be async and all firebase i/o *is*
            // so thats why we pack that lofiv into a async function and run that her
  }


// initial login state should obviously by false 
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;  // getter connected to a private var


  Future<void> init() async {
    // make sure firebase core stuff is initialized
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  // make sure 
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

  // automatically listen to 
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }
      notifyListeners(); // Whenever that state changes, notify to all listeners (we will have to )
    });
  }
  
}