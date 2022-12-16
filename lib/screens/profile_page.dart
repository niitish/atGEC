import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double? pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin:
              EdgeInsets.only(top: pageHeight == Null ? 0 : pageHeight / 50),
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://picsum.photos/200/300"),
                    radius: 100,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("KRISHNA DUBEY"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Text("data"),
                      ),
                      Card(
                        child: Text("data"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
