import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
// run `flutter pub add shared_preferences` to actually install the package into our project first

/*
  shared_preferences creates a local cache that can store key:value data.
  - keys are always strings
  - values can be bool, int, double (a.k.a. 'float' in other langs), string, List<String>
  - we get access to the following abstractions:
     a) getters and setters to read/write (e.g. setBool, getBool; setStringList, getStringList)
     b) remove(key) to reset a key's value to null
     c) clear()     to reset all cached data
  - initial values for all keys (if never specified/written to) is null

  NOTE: local storage & shared prefs won't work on browser emulation
*/


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _darkMode = false;

  Future<bool> _readDarkModeFromSharedPrefs() async {
    // if we had a bunch of initial settings, this method could just be to load all initial preferences
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode') ?? _darkMode;  // set a fallback state in case value is null
  }

  @override initState() {
    super.initState();
    // read the saved value once, then rebuild/re-render with it
    // that method is async & initState can't be, so I use {method}.then() instead of final darkMode = await {method}
    _readDarkModeFromSharedPrefs().then(
      (isDarkMode) {
        setState(() { _darkMode = isDarkMode; });
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Prefs Demo'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildDarkModeSwitch(),
              const SizedBox(height: 20),
              Text(_darkMode ? 'Dark Mode is ON' : 'Dark Mode is OFF'),
            ],
          ),
        ),
      ),
    );
  }

  SwitchListTile _buildDarkModeSwitch() {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: _darkMode,
      onChanged: (value) async {
        // I still change state first, to prioritise local re-render ahead of cache i/o
        setState(() {
          _darkMode = value;
        });
        // after doing that, write the new value to the cache
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('darkMode', value);
        // we aren't reading the cache yet, just writing to it whenever we change the setting
      },
    );
  }
}
