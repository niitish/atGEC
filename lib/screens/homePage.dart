import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Home Page"),
          Container(
            child: RandomGenerator(),
            margin: EdgeInsets.symmetric(vertical: 100),
          ),
          const BottomBar(),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
    ]);
  }
}

class RandomGenerator extends StatelessWidget {
  RandomGenerator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            child: const Text("Click to Generate"),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => _PopUp(context));
            })
      ],
    );
  }

  int generateNum() {
    var randomNum = Random();
    int num = randomNum.nextInt(10000);
    var url = Uri.https('localhost', ':3000/test');
    var response = http.post(url, body: {"value": num.toString()});

    return num;
  }

  Widget _PopUp(BuildContext context) {
    return AlertDialog(
      title: const Text("OTP for current class:"),
      content: Column(children: [Text(generateNum().toString())]),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
