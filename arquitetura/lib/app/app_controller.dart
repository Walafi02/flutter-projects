import 'package:arquitetura/app/services/shared_local_storage_service.dart';
import 'package:arquitetura/app/viewmodels/change_theme_view_model.dart';
import 'package:flutter/cupertino.dart';

class AppController {
  static final AppController instance = AppController._();

  final ChangeThemeViewModel changeThemeViewModel = ChangeThemeViewModel(
    storage: SharedLocalStorageService(),
  );

  AppController._() {
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
