import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mobile UI Form')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Placeholder(),
        ),
      ),
    );
  }
}


class UserSignUpForm extends StatefulWidget {
  const UserSignUpForm({super.key})

  @override 
  State<UserSignUpForm> createState() => _UserSignUpFormState();
}


class _UserSignUpFormState extends State<UserSignUpForm> {

  final _formKey = GlobalKey<FormState>();
  
}



FormFieldValidator<String> requiredText(String fieldName) {
  return (value) => value == null || value.trim().isEmpty ? '$fieldName cannot be empty' : null;
}

class UserSignUpForm extends StatelessWidget {
  const UserSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'New User Form',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Username cannot be empty'
                : null,
            decoration: InputDecoration(label: Text('Username')),
          ),
          const TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Password')),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
print('valid');
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
