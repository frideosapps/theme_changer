import 'package:flutter/material.dart';

import 'blocs/bloc_provider.dart';
import 'screens/settings.dart';

// AppBar actions
enum ActionPage { info, settings, help }

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context);

    var expansionTileStyle =
        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic);

    return Scaffold(
      appBar: AppBar(title: Text('Title app'), actions: <Widget>[
        PopupMenuButton(
          onSelected: (value) {
            var page;
            switch (value) {
              case ActionPage.info:
                //TODO: InfoPage
                page = Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(
                        "Info",
                      ),
                    ),
                    body: Container(
                        alignment: Alignment.center, child: Text('INFO PAGE')));
                break;
              case ActionPage.help:
                //TODO: HelpPage
                page = Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(
                        "Help",
                      ),
                    ),
                    body: Container(
                        alignment: Alignment.center, child: Text('HELP PAGE')));
                break;
              case ActionPage.settings:
                page = SettingsPage(bloc: bloc);
                break;
              default:
                break;
            }
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => page),
            );
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: ActionPage.info,
                child: Text('Info'),
              ),
              PopupMenuItem(
                value: ActionPage.help,
                child: Text('Help'),
              ),
              PopupMenuItem(
                value: ActionPage.settings,
                child: Text('Settings'),
              ),
            ];
          },
        ),
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header',
                  style: TextStyle(color: Colors.white, fontSize: 22.0)),
              padding: EdgeInsets.all(36.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('Page one'),
            ),
            ListTile(
              title: Text('Page two'),
              onTap: () {},
            ),
            ExpansionTile(
              title: Text(
                'Expansion tile 1',
                style: expansionTileStyle,
              ),
              children: [
                ListTile(
                  title: Text('Page three'),
                ),
                ListTile(
                  title: Text('Page four'),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Expansion tile 2',
                style: expansionTileStyle,
              ),
              children: [
                ListTile(
                  title: Text('Page five'),
                ),
                ListTile(
                  title: Text('Page six'),
                ),
              ],
            ),
            AboutListTile(child: Text('About this app'),),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Starter app',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
