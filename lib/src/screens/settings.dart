import 'package:flutter/material.dart';

import 'package:frideos/frideos.dart';

import '../models/appstate.dart';

import '../models/theme.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = AppStateProvider.of<AppState>(context);

    _buildThemesList() {
      return appState.themes.map((MyTheme appTheme) {
        return DropdownMenuItem<MyTheme>(
          value: appTheme,
          child: Text(appTheme.name, style: TextStyle(fontSize: 14.0)),
        );
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Choose a theme:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),         
                ValueBuilder<MyTheme>(
                    stream: appState.currentTheme,
                    builder: (context, snapshot) {
                      return DropdownButton<MyTheme>(
                        hint: Text("Status"),
                        value: snapshot.data,
                        items: _buildThemesList(),
                        onChanged: appState.setTheme,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
