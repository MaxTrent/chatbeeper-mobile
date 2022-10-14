import 'package:flutter/material.dart';
import 'preferences.dart';

class ModelTheme extends ChangeNotifier {
  var themePreference = AppPreferences();
  final bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  ThemeMode themeMode = ThemeMode.dark;

  //----If theme mode is equal to dark then we return True----
  //-----isDarkMode--is the field we will use in our switch---
  bool get isDarkMode => themeMode == ThemeMode.dark;

  setTheme(bool value) {}

  // ---implement ToggleTheme function----
  Future<void> toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;

    //---notify material app to update UI----
    notifyListeners();
  }
}
