import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';
import 'package:ola_mundo/home_page.dart';
import 'package:ola_mundo/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instace,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.red,
                brightness: AppController.instace.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light),
            initialRoute: "/",
            routes: {
              "/": (context) => LoginPage(),
              "/home": (context) => HomePage()
            },
            );
      },
    );
  }
}
