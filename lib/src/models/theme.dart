import 'package:flutter/material.dart';

class MyTheme {
  Brightness brightness;
  Color backgroundColor;
  Color scaffoldBackgroundColor;
  Color primaryColor;
  Brightness primaryColorBrightness;
  Color accentColor;

  MyTheme(
      {this.brightness,
      this.backgroundColor,
      this.scaffoldBackgroundColor,
      this.primaryColor,
      this.primaryColorBrightness,
      this.accentColor});
}

class AppTheme {
  String name;
  MyTheme theme;
  AppTheme(this.name, this.theme);
}

List<AppTheme> myThemes = [
  AppTheme(
      'Default',
      MyTheme(
        brightness: Brightness.light,
        backgroundColor: Colors.blue[50],
        scaffoldBackgroundColor: Colors.blue[50],
        primaryColor: Colors.blue,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.blue[300],
      )),
  AppTheme(
    'Teal',
    MyTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.teal[50],
      scaffoldBackgroundColor: Colors.teal[50],
      primaryColor: Colors.teal[600],
      primaryColorBrightness: Brightness.dark,
      accentColor: Colors.teal[300],
    ),
  ),
  AppTheme(
    'Orange',
    MyTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.orange[50],
      scaffoldBackgroundColor: Colors.orange[50],
      primaryColor: Colors.orange[600],
      primaryColorBrightness: Brightness.dark,
      accentColor: Colors.orange[300],
    ),
  ),
];
