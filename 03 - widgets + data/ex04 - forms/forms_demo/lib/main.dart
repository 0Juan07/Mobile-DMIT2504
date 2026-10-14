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
        appBar: AppBar(
          title: const Text('Mobile UI Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const UserSignupForm(),
        ),
      ),
    );
  }
}

class UserSignupForm extends StatefulWidget {
  
  const UserSignupForm({super.key});

  @override
  State<UserSignupForm> createState() => _UserSignupFormState();

}


class _UserSignupFormState extends State<UserSignupForm> {


  FormFieldValidator<String> requiredField(String fieldName) {
    // ternary gang: condition ? ifTrue : ifFalse
    return (value) => 
      value == null || value.trim().isEmpty // is it null OR is it blank when trimmed
      ? '$fieldName cannot be empty'  // value is bad:   return error message w/ dynamic fieldname
      : null;                         // value is gucci: return null
  }

  @override
  Widget build(BuildContext context) {
    // 1. wrap everything in a form. once I convert TextFields to TextFormFields, I can validate everything at once.
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // code-writing style choice: you *can* compress stuff onto one line, if it's still easy to read
          
          const Text('New User Form', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          
          /* 2. convert input fields to form fields, e.g. TextField -> TextFormField
                -> What do I get out of this?
                   a) a validation parameter, for validating the value
                   b) all FormFields plug into the Form wrapping them, so some button press / action
                      can validate every single one of its fields at once
          */
          TextFormField(
            validator: requiredField('Username'),
            decoration: InputDecoration(label: Text('Username'))
          ),
          
          TextFormField(
            validator: requiredField('Password'),
            obscureText: true, 
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(label: Text('Password')),
          ),
  
          ElevatedButton(
            onPressed: () => false,
            child: const Text('Sign Up'),
          ),

        ],
      ),
    );
  }

}


