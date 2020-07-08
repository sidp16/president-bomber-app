import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/views/information_cards.dart';
import 'package:presidentbomber/views/messages/players_list_message.dart';
import 'package:presidentbomber/views/messages/roles_list_message.dart';
import 'package:presidentbomber/views/messages/roles_lobby_message.dart';
import 'package:presidentbomber/views/messages/unique_role_message.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';
import 'package:presidentbomber/views/timer/round_timer.dart';

import '../drawer/drawers.dart';

class PlayerGameScreen extends StatefulWidget {
  final String gameId;
  final String name;

  PlayerGameScreen(this.gameId, this.name);

  @override
  _PlayerGameScreenState createState() => _PlayerGameScreenState();
}

class _PlayerGameScreenState extends State<PlayerGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.gameId} | Player View"),
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
            .document(this.widget.gameId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          int secondsLeft;

          var gameEnd = snapshot.data['gameEnd'];
          if (gameEnd != null) {
            secondsLeft = gameEnd.toDate().difference(DateTime.now()).inSeconds;
          }

          List informationSubtext = [
            RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
            PlayersListMessage(snapshot.data[PLAYERS]),
            RolesListMessage(snapshot.data[ROLES]),
            UniqueRoleMessage(
                snapshot.data[DISTRIBUTIONS][widget.name], widget.name),
            secondsLeft != null
                ? RoundTimer(secondsLeft)
                : Text("Waiting for owner to start!")
          ];

          if (snapshot.data[PLAYERS].indexOf(this.widget.name) == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OwnerGameScreen(this.widget.gameId, this.widget.name)));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PlayerInformationCard(informationSubtext: informationSubtext),
            ],
          );
        },
      ),
    );
  }
}
