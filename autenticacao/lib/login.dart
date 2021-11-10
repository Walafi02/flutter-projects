import 'dart:convert';

import 'package:autenticacao/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return "Par favor, digite seu email";
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_emailController.text)) {
                    return 'Por favor, digite um e-mail correto';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return "Par favor, digite seu senha";
                  } else if (password.length < 6) {
                    return "Par favor, digite uma senha com mais de 6 caracteres!";
                  }

                  return null;
                },
              ),
              ElevatedButton(onPressed: () async {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (_formKey.currentState!.validate()){
                  bool hasLogad = await login();

                  // fecha o teclado
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }

                  if (hasLogad) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    _passwordController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              }, child: Text("ENTRAR"))
            ],
          ),
        ),
      ),
    ));
  }

  final snackBar = const SnackBar(content: Text(
    "E-mail ou Senha Invalidos!", textAlign: TextAlign.center,
  ), backgroundColor: Colors.redAccent,);

  Future<bool> login() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse("http://10.0.0.145:3333/session");

    var response = await http.post(url, body: {
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    if (response.statusCode == 200) {
      await sharedPreferences.setString('token', "Token ${jsonDecode(response.body)['token']}");
      return true;
    } else {
      return false;
    }
  }
}
