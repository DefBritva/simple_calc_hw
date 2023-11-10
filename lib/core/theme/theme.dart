import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
  primaryColor: Colors.purpleAccent,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.purpleAccent),
  colorScheme: const ColorScheme.light(
      primary: Colors.purpleAccent, secondary: Colors.black),
);

ThemeData darkMode = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    primaryColor: Colors.deepPurpleAccent,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
    colorScheme: const ColorScheme.dark(
        primary: Colors.deepPurpleAccent, secondary: Colors.white));

class ThemeChanger {
  ThemeData _themeData = darkMode;

  // ignore: unnecessary_getters_setters
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme() {
    if (_themeData == darkMode) {
      themeData = lightMode;
    } else {
      themeData = darkMode;
    }
  }
}
