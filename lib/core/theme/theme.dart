import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primaryColor: Colors.purpleAccent,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.purpleAccent),
  colorScheme: const ColorScheme.light(
      primary: Colors.purpleAccent, secondary: Colors.black),
);

ThemeData darkMode = ThemeData(
    primaryColor: Colors.deepPurpleAccent,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
    colorScheme: const ColorScheme.dark(
        primary: Colors.deepPurpleAccent, secondary: Colors.white));

class ThemeChanger {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
