import 'package:explorer/api/Services/User/auth_api.dart';
import 'package:explorer/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthAPI _authAPI = AuthAPI();
  final _key = GlobalKey<FormState>();
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 70),
                  Text("Sign In"),
                  SizedBox(height: 30),
                  Container(
                      width: 400,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person), hintText: "Email"),
                        onChanged: (val) => setState(() => email = val),
                      )),
                  SizedBox(height: 30),
                  Container(
                    width: 400,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(Icons.password), hintText: "Password"),
                      onChanged: (val) => setState(() => password = val),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                      width: 400,
                      child: Column(
                        children: [
                          ElevatedButton.icon(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  try {
                                    var req = await _authAPI.loginUser(
                                        email, password);
                                    print("REQUEST RESPONSE:::");
                                    if (req.statusCode == 200) {
                                      print(req.body);
                                      var user = User.fromReqBody(req.body);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                    title:
                                                        "Logged in successfully",
                                                    user: user,
                                                  )));
                                      user.printAttributes();
                                    } else {
                                      print(req.body);
                                    }
                                  } on Exception catch (e) {
                                    print(e.toString());
                                  }
                                }
                                print("TEst");
                              },
                              icon: Icon(Icons.login),
                              label: Text("Login"))
                        ],
                      )),
                  SizedBox(height: 25),
                  GestureDetector(
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          fontSize: 18.0, decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      // todo
                    },
                  ),
                ],
              ))),
    );
  }

// ignore: non_constant_identifier_names
  void pushError() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  void login() {}
  customRaisedIconButton(String s, IconData send, BuildContext context,
      Future<Null> Function() param3) {}
}
