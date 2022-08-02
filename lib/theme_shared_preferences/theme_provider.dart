import 'package:flutter/material.dart';

import 'theme_shared_preferences.dart';

class MyThemeModel with ChangeNotifier {
  late bool _isDark;
  late ThemeSharedPreferences themeSharedPreferences;

  bool get isDark => _isDark;

  MyThemeModel() {
    _isDark = true;

    themeSharedPreferences = ThemeSharedPreferences();
    getThemePrefrences();
  }

  set isDark(bool value) {
    _isDark = value;
    themeSharedPreferences.setTheme(value);
    notifyListeners();
  }

  getThemePrefrences() async {
    _isDark = await themeSharedPreferences.getTheme();
    notifyListeners();
  }
}
