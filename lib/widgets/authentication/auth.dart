import 'package:explorer/widgets/authentication/sign_in.dart';
import 'package:explorer/widgets/authentication/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showCreate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  showCreate = !showCreate;
                });
              },
              alignment: Alignment.topLeft,
              icon: Icon(Icons.swap_horiz))
        ],
      ),
      body: Container(child: showCreate ? SignIn() : SignUp()),
    );
  }
}
