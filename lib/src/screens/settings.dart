import 'package:flutter/material.dart';

import '../blocs/appbloc.dart';
import '../models/theme.dart';

class SettingsPage extends StatefulWidget {
  final AppBloc bloc;

  SettingsPage({Key key, @required this.bloc}) : super(key: key);

  @override
  SettingsPageState createState() {
    return new SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Choose a theme:', style: TextStyle(fontWeight: FontWeight.w500),),
                ),
                
                StreamBuilder(
                    stream: widget.bloc.theme.outStream,
                    builder: (context, AsyncSnapshot<AppTheme> snapshot) {
                      return snapshot.hasData
                          ? DropdownButton<AppTheme>(
                              hint: Text("Status"),
                              value: snapshot.data,
                              items: myThemes.map((AppTheme appTheme) {
                                return DropdownMenuItem<AppTheme>(
                                  value: appTheme,
                                  child: Text(appTheme.name, style: TextStyle(fontSize: 14.0)),
                                );
                              }).toList(),
                              onChanged: widget.bloc.theme.inStream,
                            )
                          : Container();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
