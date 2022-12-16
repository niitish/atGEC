import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: screenWidth / 2),
            child: Form(
              key: _formKey,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomTextField(
                  screenWidth: screenWidth,
                  controller: loginController['userName'],
                  name: "username",
                ),
                CustomTextField(
                  screenWidth: screenWidth,
                  controller: loginController['password'],
                  hide: true,
                  name: "password",
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    margin: EdgeInsets.only(top: screenWidth / 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: const Text(
                      "login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () async {
                    String url = "http://172.16.9.66:8080/login";

                    print("sending login data");
                    var response = await http.post(
                      Uri.parse(url),
                      body: {
                        "userName": loginController['userName'].toString(),
                        "password": loginController['password'].toString(),
                      },
                    );

                    print(response);
                  },
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void sendData() {}
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.screenWidth,
      required this.controller,
      this.hide = false,
      this.name = "default"})
      : super(key: key);

  final double screenWidth;
  final TextEditingController? controller;
  bool hide;
  String name;

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
        decoration: InputDecoration(label: Text(name)),
        obscureText: hide,
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
