import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
// flutter pub add shared_preferences  to install the package

/*

  shared preferences creates a local cache that can store key:value
  - keys are always strings
  - values can be bool, int, double
  - we get access to following abstractions
    a. getters and setters to read/write
    b. remove (key) to reset a key's value
    c. clear() to reset all cached data
  - inital values for all keys is null (if never specified)

*/

void main() async {
  // no flash ligh-mode

  WidgetsFlutterBinding.ensureInitialized();

  // get prefs and pass it to the main app
  final prefs = await SharedPreferences.getInstance();
  runApp(MainApp(darkMode: prefs.getBool('darkMode') ?? false));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.darkMode});

  final bool darkMode;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late bool _darkMode = widget.darkMode;

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
        // i still change state first. to prioritize local re - render
        setState(() {
          _darkMode = value;
        });
        // after that write the new value to cache
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('darkMode', value);
      },
    );
  }
}
