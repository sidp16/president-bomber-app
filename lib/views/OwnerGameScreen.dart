import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/drawer.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/testing.dart';
import 'package:presidentbomber/widgets/buttons.dart';
import 'dart:collection';

import '../text_on_screen.dart';

class OwnerGameScreen extends StatelessWidget {
  final String gameId;
  final String name;
  int _counter = 180;
  Timer _timer;

  OwnerGameScreen(this.gameId, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$gameId | Owner Console"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.red])),
        ),
      ),
      drawer: PlayerOwnerDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlueHostageButton(
                        gameId, snapshot.data[ROLES], snapshot.data[PLAYERS]),
                    Container(
                      height: 103,
                      child: DistributeButton(
                          gameId,
                          name,
                          snapshot.data[ROLES],
                          snapshot.data[PLAYERS],
                          snapshot.data[DISTRIBUTIONS][name]),
                    ),
                    RedHostageButton(
                        gameId, snapshot.data[ROLES], snapshot.data[PLAYERS]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SniperButton(gameId: gameId),
                    GamblerButton(gameId: gameId),
                    MastermindButton(gameId: gameId),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TargetButton(gameId: gameId),
                    HeroButton(gameId: gameId),
                    DecoyButton(gameId: gameId),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HotPotatoButton(gameId: gameId),
                    AnarchistButton(gameId: gameId),
                    TravelerButton(gameId: gameId),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClearRolesButton(gameId: gameId),
                    LeaveGameButton(gameId, name),
                  ],
                ),
              ),
              RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
              PlayersListMessage(snapshot.data[PLAYERS]),
              RolesListMessage(snapshot.data[ROLES]),
              UniqueRoleMessage(snapshot.data[DISTRIBUTIONS][name], name),
            ],
          );
        },
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        height: 60,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
          child: InkWell(
              splashColor: Colors.grey,
              onTap: onTap,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(icon,
                              size: 27.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(text, style: TextStyle(fontSize: 20.0)),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ])),
        ),
      ),
    );
  }
}