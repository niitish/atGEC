import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'profile_page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 100),
            child: RandomGenerator(),
          ),
          const BottomBar(),
        ],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      BottomNavigationBarItem(icon: Icon(Icons.login_outlined), label: "Login"),
    ], onTap: (value) => _onItemTapped(value));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else if (_selectedIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
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
        InkWell(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: const BoxDecoration(
                  // border: Border.all(width: 1, color: Colors.black),
                  // color: Colors.black,
                  color: Colors.blue),
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Send OTP",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // child: TextButton(
              //     child: const Text("Click to Generate"),
              //     onPressed: () {
              //       showDialog(
              //           context: context,
              //           builder: (BuildContext context) => _PopUp(context));
              //     }),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) => _PopUp(
                context,
                generateNum(),
              ),
            ),
          },
        ),
      ],
    );
  }

  int generateNum() {
    var randomNum = Random();
    int num = randomNum.nextInt(10000);
    return num;
  }

  void sendRandomNum(int num) async {
    print("Testing for http request");
    // var url = Uri.https('172.16.9.66', ':8080');
    String url = "http://172.16.9.66:8080/";
    var response =
        await http.post(Uri.parse(url), body: {"value": num.toString()});
    print("Testing for http request");
    print(response);
  }

  Widget _PopUp(BuildContext context, int num) {
    sendRandomNum(num);

    return AlertDialog(
      title: const Text("OTP for current class:"),
      content: Column(children: [Text(num.toString())]),
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
