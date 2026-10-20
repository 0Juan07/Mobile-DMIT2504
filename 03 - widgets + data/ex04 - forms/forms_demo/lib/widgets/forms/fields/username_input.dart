import 'package:flutter/material.dart';


class UsernameInput extends StatefulWidget {

  // we need to pass two things to a custom field:
  //  - a controller (so that the outer form using it can read its values)
  //  - a label for the field (not necessary, but may as well make it flexible)
  final TextEditingController controller;
  final String label;

  const UsernameInput({
    super.key,
    required this.controller,
    this.label = 'Username',
  });


  @override
  State<UsernameInput> createState() => _UsernameInputState();
}


class _UsernameInputState extends State<UsernameInput> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value == null || value.trim() == ''
        ? 'Username cannot be empty'
        : null,
      decoration: InputDecoration(label: Text('Username'))
      // ideally we'd still have helper functions e.g. "requiredField"
    );
  }
}
