import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/buttons/clear_roles.dart';
import 'package:presidentbomber/buttons/distribute_button.dart';
import 'package:presidentbomber/buttons/hostage_button.dart';
import 'package:presidentbomber/buttons/leave_game_button.dart';
import 'package:presidentbomber/buttons/special_role_button.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';
import 'package:presidentbomber/views/messages/players_list_message.dart';
import 'package:presidentbomber/views/messages/roles_list_message.dart';
import 'package:presidentbomber/views/messages/roles_lobby_message.dart';
import 'package:presidentbomber/views/messages/unique_role_message.dart';
import 'package:presidentbomber/views/timer/round_timer.dart';

class OwnerGameScreen extends StatefulWidget {
  final String gameId;
  final String name;

  OwnerGameScreen(this.gameId, this.name);

  @override
  _OwnerGameScreenState createState() => _OwnerGameScreenState();
}

class _OwnerGameScreenState extends State<OwnerGameScreen> {
  RoundTimer currentRoundTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.gameId} | Owner Console"),
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
          return _buildContent(snapshot);
        },
      ),
    );
  }

  Column _buildContent(AsyncSnapshot snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildTopRow(snapshot),
        buildRoleRow1(),
        buildRoleRow2(),
        buildRoleRow3(),
        buildUtilityButtons(),
        RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
        PlayersListMessage(snapshot.data[PLAYERS]),
        RolesListMessage(snapshot.data[ROLES]),
        UniqueRoleMessage(
            snapshot.data[DISTRIBUTIONS][widget.name], widget.name),
        currentRoundTimer != null
            ? currentRoundTimer
            : Text("Waiting for creator to start!"),
      ],
    );
  }

  Padding buildRoleRow3() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialRoleButton(
              gameId: widget.gameId,
              role: HOTPOTATO,
              colour: Colors.red,
              splashColour: Colors.redAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: ANARCHIST,
              colour: Colors.red,
              splashColour: Colors.redAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: TRAVELER,
              colour: Colors.red,
              splashColour: Colors.redAccent),
        ],
      ),
    );
  }

  Padding buildRoleRow2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialRoleButton(
            gameId: widget.gameId,
            role: TRAVELER,
            colour: Colors.red,
            splashColour: Colors.redAccent,
          ),
          SpecialRoleButton(
            gameId: widget.gameId,
            role: HERO,
            splashColour: Colors.red,
            colour: Colors.redAccent,
          ),
          SpecialRoleButton(
            gameId: widget.gameId,
            role: DECOY,
            splashColour: Colors.red,
            colour: Colors.redAccent,
          ),
        ],
      ),
    );
  }

  Padding buildRoleRow1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialRoleButton(
              gameId: widget.gameId,
              role: SNIPER,
              colour: Colors.red,
              splashColour: Colors.redAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: GAMBLER,
              colour: Colors.red,
              splashColour: Colors.redAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: MASTERMIND,
              colour: Colors.red,
              splashColour: Colors.redAccent),
        ],
      ),
    );
  }

  Padding buildTopRow(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HostageButton(
              gameId: widget.gameId,
              role: BLUE,
              color: Colors.blue,
              splashColor: Colors.blueAccent),
          Container(
            height: 103,
            child: DistributeButton(
                gameId: widget.gameId,
                onPressed: () {
                  // Distribute roles (update db)
                  distributeRoles(widget.gameId, snapshot.data[ROLES],
                      snapshot.data[PLAYERS]);

                  // Calculate how many seconds left
                  setState(() {
                    currentRoundTimer = new RoundTimer(180);
                  });
                }),
          ),
          HostageButton(
              gameId: widget.gameId,
              role: RED,
              color: Colors.red,
              splashColor: Colors.redAccent),
        ],
      ),
    );
  }

  Padding buildUtilityButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClearRolesButton(gameId: widget.gameId),
          LeaveGameButton(widget.gameId, widget.name),
        ],
      ),
    );
  }
}
