import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/information_cards.dart';
import 'package:presidentbomber/text_on_screen.dart';
import 'package:presidentbomber/views/OwnerGameScreen.dart';

import '../drawers.dart';

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
          int _counter = snapshot.data['gameEnd'].toDate().difference(DateTime.now()).inSeconds;
          Timer _timer;

          _startTimer() {
            if (_timer != null) {
              _timer.cancel();
            }
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              setState(() {
                if (_counter > 0) {
                  _counter--;
                } else {
                  _timer.cancel();
                  _counter = 0;
                }
              });
            });
          }

          List informationTitles = [
            'Members and Roles',
            'Players in Game',
            'Roles in Game',
            'Your Role',
            'Timer'
          ];
          List informationSubtext = [
            RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
            PlayersListMessage(snapshot.data[PLAYERS]),
            RolesListMessage(snapshot.data[ROLES]),
            UniqueRoleMessage(
                snapshot.data[DISTRIBUTIONS][widget.name], widget.name),
            TimerMessage(counter: _counter)
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
              PlayerInformationCard(
                  informationTitles: informationTitles,
                  informationSubtext: informationSubtext),
            ],
          );
        },
      ),
    );
  }
}
