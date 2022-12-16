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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(children: [
              CustomTextField(
                screenWidth: screenWidth,
                controller: loginController['userName'],
              ),
              CustomTextField(
                screenWidth: screenWidth,
                controller: loginController['password'],
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  color: Colors.blue,
                  padding: const EdgeInsets.all(30),
                  child: const Text(
                    "login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.screenWidth,
    required this.controller,
  }) : super(key: key);

  final double screenWidth;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: screenWidth / 10,
        right: screenWidth / 10,
        top: screenWidth / 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter some value";
          }
        },
      ),
    );
  }
}
