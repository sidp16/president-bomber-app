import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presidentbomber/images/bomb_image.dart';
import 'package:presidentbomber/images/president_image.dart';
import 'package:presidentbomber/views/drawer/drawerTiles.dart';
import 'package:presidentbomber/views/messages/president_bomber_title_in_drawer.dart';

import '../../utils.dart';

class PlayerOwnerDrawer extends StatelessWidget {
  const PlayerOwnerDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PresidentImage(),
                      BombImage(),
                    ],
                  ),
                  PresidentBomberTitleInDrawer()
                ],
              )),
          CustomListTile(Icons.home, 'Home', () => {moveToHomePage(context)}),
          CustomListTile(Icons.person, 'Characters',
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.library_books, 'Rules',
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.build, 'App Usage', () => {}),
          CustomListTile(Icons.accessibility, 'About Me', () => {}),
          CustomListTile(Icons.report_problem, 'Report', () => {}),
        ],
      ),
    );
  }
}

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PresidentImage(),
                      BombImage(),
                    ],
                  ),
                  PresidentBomberTitleInDrawer()
                ],
              ))),
          CustomListTile(Icons.person, 'Characters',
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.library_books, 'Rules',
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.build, 'App Usage', () => {}),
          CustomListTile(Icons.accessibility, 'About Me', () => {}),
          CustomListTile(Icons.report_problem, 'Report', () => {}),
        ],
      ),
    );
  }
}

class CharacterRulesDrawer extends StatelessWidget {
  const CharacterRulesDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.blueAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [PresidentImage(), BombImage()],
                  ),
                  PresidentBomberTitleInDrawer()
                ],
              )),
          CustomListTile(Icons.home, 'Home', () => {moveToHomePage(context)}),
          CustomListTile(Icons.build, 'App Usage', () => {}),
          CustomListTile(Icons.accessibility, 'About Me', () => {}),
          CustomListTile(Icons.report_problem, 'Report', () => {}),
        ],
      ),
    );
  }
}
