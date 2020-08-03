import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presidentbomber/images/bomb_image.dart';
import 'package:presidentbomber/images/president_image.dart';
import 'package:presidentbomber/views/dialogs/OwnerLeaveGameDialog.dart';
import 'package:presidentbomber/views/dialogs/PlayerLeaveGameDialog.dart';
import 'package:presidentbomber/views/drawer/drawerTiles.dart';
import 'package:presidentbomber/views/messages/president_bomber_title_in_drawer.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';
import 'package:presidentbomber/views/screens/PlayerGameScreen.dart';
import 'package:presidentbomber/views/screens/RulesCharactersScreen.dart';

import '../../constants.dart';
import '../../utils.dart';

class OwnerDrawer extends StatelessWidget {
  final String gameId;
  final String name;

  OwnerDrawer(this.gameId, this.name);

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
          CustomListTile(
            Icons.home,
            LEAVE_GAME,
            () => {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return OwnerLeaveGameDialog(
                        widget: OwnerGameScreen(gameId, name));
                  }),
            },
          ),
          CustomListTile(Icons.person, CHARACTERS,
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.library_books, RULES,
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.report_problem, REPORT, () => {}),
          CustomListTile(Icons.accessibility, ABOUT, () => {}),
        ],
      ),
    );
  }
}

Future moveToCharacterRulesScreen(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => CharacterRulesScreen()));
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
          CustomListTile(Icons.person, CHARACTERS,
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.library_books, RULES,
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.report_problem, REPORT, () => {}),
          CustomListTile(Icons.accessibility, ABOUT, () => {}),
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
          CustomListTile(Icons.report_problem, REPORT, () => {}),
          CustomListTile(Icons.accessibility, ABOUT, () => {}),
        ],
      ),
    );
  }
}

class PlayerDrawer extends StatelessWidget {
  final String gameId;
  final String name;

  PlayerDrawer(this.gameId, this.name);

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
          CustomListTile(
            Icons.home,
            LEAVE_GAME,
            () => {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return PlayerLeaveGameDialog(
                        widget: PlayerGameScreen(gameId, name));
                  }),
            },
          ),
          CustomListTile(Icons.person, CHARACTERS,
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.library_books, RULES,
              () => {moveToCharacterRulesScreen(context)}),
          CustomListTile(Icons.report_problem, REPORT, () => {}),
          CustomListTile(Icons.accessibility, ABOUT, () => {}),
        ],
      ),
    );
  }
}
