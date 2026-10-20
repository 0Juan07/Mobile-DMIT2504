import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  // we need 2 things to custom fields
  // a controller so that the outer firn using it can read its value
  // a label for the field not necessary but nay as wellmake it flexible

  final TextEditingController controller;
  final String label;

  const PasswordInput({
    super.key,
    required this.controller,
    this.label = 'Password',
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
