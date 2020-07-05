import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/information_cards.dart';
import 'package:presidentbomber/text_on_screen.dart';
import 'package:presidentbomber/views/OwnerGameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';

import '../drawers.dart';

class PlayerGameScreen extends StatelessWidget {
  final String gameId;
  final String name;

  PlayerGameScreen(this.gameId, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$gameId | Player View"),
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
          List informationTitles = [
            'Members and Roles',
            'Players in Game',
            'Roles in Game',
            'Your Role'
          ];
          List informationSubtext = [
            RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
            PlayersListMessage(snapshot.data[PLAYERS]),
            RolesListMessage(snapshot.data[ROLES]),
            UniqueRoleMessage(snapshot.data[DISTRIBUTIONS][name], name)
          ];
          if (snapshot.data[PLAYERS].indexOf(this.name) == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OwnerGameScreen(this.gameId, this.name)));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PlayerInformationCard(informationTitles: informationTitles, informationSubtext: informationSubtext),
            ],
          );
        },
      ),
    );
  }
}