import 'package:flutter/material.dart';

class UsernameFormField extends StatefulWidget {
  // we need 2 things to custom fields
  // a controller so that the outer firn using it can read its value
  // a label for the field not necessary but nay as wellmake it flexible

  final TextEditingController controller;
  final String label;

  const UsernameFormField({
    super.key,
    required this.controller,
    this.label = 'Username',
  });

  @override
  State<UsernameFormField> createState() => _UsernameFormFieldState();
}

class _UsernameFormFieldState extends State<UsernameFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value == null || value.trim() == ''
          ? 'Username cannot be empty'
          : null,
      decoration: InputDecoration(label: Text('Username')),
      // ideally we'd still have helper functions e.g. "requiredField"
    );
  }
}
