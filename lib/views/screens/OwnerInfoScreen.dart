import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/views/information_cards.dart';
import 'package:presidentbomber/views/messages/players_list_message.dart';
import 'package:presidentbomber/views/messages/roles_list_message.dart';
import 'package:presidentbomber/views/messages/roles_lobby_message.dart';
import 'package:presidentbomber/views/messages/unique_role_message.dart';
import 'package:presidentbomber/views/timer/round_timer.dart';

class OwnerInfoScreen extends StatefulWidget {
  final String gameId;
  final String name;

  OwnerInfoScreen(this.gameId, this.name);

  @override
  _OwnerInfoScreenState createState() => _OwnerInfoScreenState();
}

class _OwnerInfoScreenState extends State<OwnerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("${widget.gameId} | Owner Game Info"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.lightBlue, Colors.blue])),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.widget.gameId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          List informationSubtext = [
            RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
            PlayersListMessage(snapshot.data[PLAYERS]),
            RolesListMessage(snapshot.data[ROLES]),
            UniqueRoleMessage(
                snapshot.data[DISTRIBUTIONS][widget.name], widget.name),
            buildRoundTimer(context, snapshot)
          ];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PlayerInformationCard(
                informationSubtext: informationSubtext,
                role: snapshot.data[DISTRIBUTIONS][widget.name],
                gameID: this.widget.gameId,
                name: this.widget.name,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildRoundTimer(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data[GAME_END] != null) {
      int secondsLeft =
          snapshot.data[GAME_END].toDate().difference(DateTime.now()).inSeconds;
      if (secondsLeft > 0) {
        return RoundTimer(snapshot.data[GAME_END]);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child:
              Text(WAITING_FOR_TIMER_MESSAGE, style: TextStyle(fontSize: 18))),
    );
  }
}
