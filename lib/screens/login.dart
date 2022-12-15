import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, TextEditingController> loginController = {
    'userName': TextEditingController(),
    'password': TextEditingController()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: loginController['username'],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some value";
                }
              },
            ),
            TextFormField(
              controller: loginController['password'],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some value";
                } else {}
              },
            ),
          ]),
        ),
      ),
    );
  }
}
