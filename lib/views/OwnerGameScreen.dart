import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/drawers.dart';
import 'package:presidentbomber/widgets/buttons.dart';

import '../text_on_screen.dart';

class OwnerGameScreen extends StatelessWidget {
  final String gameId;
  final String name;
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