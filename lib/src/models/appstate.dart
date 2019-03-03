import 'package:frideos/frideos.dart';

import 'package:flutter/material.dart';

import '../models/theme.dart';

class AppState extends AppStateModel {
  List<MyTheme> themes;
  StreamedValue<MyTheme> currentTheme;

  AppState() {
    print('-------APP STATE INIT--------');

    themes = List<MyTheme>();

    themes.addAll([
      MyTheme(
        name: 'Default',
        brightness: Brightness.light,
        backgroundColor: Colors.blue[50],
        scaffoldBackgroundColor: Colors.blue[50],
        primaryColor: Colors.blue,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.blue[300],
      ),
      MyTheme(
        name: 'Teal',
        brightness: Brightness.light,
        backgroundColor: Colors.teal[50],
        scaffoldBackgroundColor: Colors.teal[50],
        primaryColor: Colors.teal[600],
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.teal[300],
      ),
      MyTheme(
        name: 'Orange',
        brightness: Brightness.light,
        backgroundColor: Colors.orange[50],
        scaffoldBackgroundColor: Colors.orange[50],
        primaryColor: Colors.orange[600],
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.orange[300],
      ),
    ]);

    currentTheme = StreamedValue();
  }

  void setTheme(MyTheme theme) {
    currentTheme.value = theme;
    Prefs.savePref<String>('apptheme', theme.name);
  }

  @override
  void init() async {    
    String lastTheme = await Prefs.getPref('apptheme');
    if (lastTheme != null) {
      currentTheme.value =
          themes.firstWhere((theme) => theme.name == lastTheme, orElse: () => themes[0]);
    } else {
      currentTheme.value = themes[0];
    }
  }

  @override
  dispose() {
    print('---------APP STATE DISPOSE-----------');
    currentTheme.dispose();
  }
}
