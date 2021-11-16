import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ola_mundo/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _bady() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  child: Image.asset("asserts/images/logo.png")),
              Container(
                height: 10,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 12, right: 12, bottom: 12),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {
                          email = text;
                        },
                        decoration: InputDecoration(
                            labelText: "E-mail", border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (text) {
                          password = text;
                        },
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          if (email == 'walafif@yahoo.com' &&
                              password == '123456') {
                            // Navigator.of(context).pushNamed("/home");
                            Navigator.of(context).pushReplacementNamed("/home");
                          }
                          print(email);
                          print(password);
                        },
                        child: Container(
                            width: double.infinity,
                            child: Text(
                              "ENTRAR",
                              textAlign: TextAlign.center,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "asserts/images/wall.jpg",
              fit: BoxFit.cover,
            )),
        Container(
          color: Colors.black.withOpacity(0.05),
        ),
        _bady()
      ],
    ));
  }
}
