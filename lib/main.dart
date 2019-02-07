import 'package:flutter/material.dart';

import 'src/homepage.dart';
import 'src/blocs/appbloc.dart';
import 'src/blocs/bloc_provider.dart';
import 'src/models/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {  
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {  
  final bloc = AppBloc();

  @override
  void initState() {
    super.initState();    
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: StreamBuilder(
          stream: bloc.theme.outStream,
          builder: (context, AsyncSnapshot<AppTheme> snapshot) {
            return MaterialApp(
              title: "Theme and drawer starter app",
                theme: snapshot.hasData
                    ? _buildThemeData(snapshot.data)
                    : ThemeData(),
                home: HomePage());
          }),
    );
  }

  _buildThemeData(AppTheme appTheme) {
    return ThemeData(
      brightness: appTheme.theme.brightness,
      backgroundColor: appTheme.theme.backgroundColor,
      scaffoldBackgroundColor: appTheme.theme.scaffoldBackgroundColor,
      primaryColor: appTheme.theme.primaryColor,
      primaryColorBrightness: appTheme.theme.primaryColorBrightness,
      accentColor: appTheme.theme.accentColor,
    );
  }
}
