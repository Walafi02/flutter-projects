import 'package:arquitetura/app/app_controller.dart';
import 'package:flutter/material.dart';

class CustonSwitchWidget extends StatelessWidget {
  const CustonSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDark,
      onChanged: (value) {
        AppController.instance.changeThemeViewModel.changeTheme(value);
      },
    );
  }
}
