import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/buttons/clear_roles.dart';
import 'package:presidentbomber/buttons/distribute_button.dart';
import 'package:presidentbomber/buttons/hostage_button.dart';
import 'package:presidentbomber/buttons/owner_info_button.dart';
import 'package:presidentbomber/buttons/special_role_button.dart';
import 'package:presidentbomber/buttons/start_game_button.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';
import 'package:presidentbomber/views/dialogs/OwnerLeaveGameDialog.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';
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
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => OwnerLeaveGameDialog(widget: widget),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("${widget.gameId.toLowerCase()} | Owner Console"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          ),
        ),
        drawer: OwnerDrawer(this.widget.gameId, this.widget.name),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection(COLLECTION_NAME)
              .document(this.widget.gameId.toLowerCase())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return _buildContent(snapshot);
          },
        ),
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
        buildHostageRow4(snapshot),
        buildUtilityButtons(snapshot),
      ],
    );
  }

  Padding buildTopRow(AsyncSnapshot snapshot) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 2),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 103,
            child: DistributeButton(
                gameId: widget.gameId,
                onPressed: () => {
                      distributeRoles(widget.gameId, snapshot.data[ROLES],
                          snapshot.data[PLAYERS], context, this.widget.name),
                    }),
          ),
          Container(
            height: 103,
            child: StartGameButton(
                onPressed: () => {
                      startTimer(
                          snapshot.data[PLAYERS],
                          snapshot.data[ROLES],
                          this.widget.name,
                          snapshot.data[DISTRIBUTIONS],
                          this.widget.gameId)
                    }),
          ),
        ]));
  }

  Padding buildHostageRow4(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HostageButton(
              gameId: widget.gameId,
              role: BLUE,
              name: this.widget.name,
              color: Colors.blue,
              splashColor: Colors.blueAccent),
          HostageButton(
              gameId: widget.gameId,
              role: RED,
              name: this.widget.name,
              color: Colors.red,
              splashColor: Colors.redAccent),
        ],
      ),
    );
  }

  Padding buildRoleRow1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialRoleButton(
              gameId: widget.gameId,
              role: SNIPER,
              colour: Colors.indigo,
              splashColour: Colors.indigoAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: GAMBLER,
              colour: Colors.indigo,
              splashColour: Colors.indigoAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: MASTERMIND,
              colour: Colors.indigo,
              splashColour: Colors.indigoAccent),
        ],
      ),
    );
  }

  Padding buildRoleRow2() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialRoleButton(
            gameId: widget.gameId,
            role: TARGET,
            colour: Colors.indigo,
            splashColour: Colors.indigoAccent,
          ),
          SpecialRoleButton(
            gameId: widget.gameId,
            role: HERO,
            splashColour: Colors.indigoAccent,
            colour: Colors.indigo,
          ),
          SpecialRoleButton(
            gameId: widget.gameId,
            role: DECOY,
            splashColour: Colors.indigoAccent,
            colour: Colors.indigo,
          ),
        ],
      ),
    );
  }

  Padding buildRoleRow3() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SpecialRoleButton(
              gameId: widget.gameId,
              role: HOTPOTATO,
              colour: Colors.indigo,
              splashColour: Colors.indigoAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: ANARCHIST,
              colour: Colors.indigo,
              splashColour: Colors.indigoAccent),
          SpecialRoleButton(
              gameId: widget.gameId,
              role: TRAVELER,
              colour: Colors.indigo,
              splashColour: Colors.indigoAccent),
        ],
      ),
    );
  }

  Padding buildUtilityButtons(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClearRolesButton(gameId: widget.gameId),
          GameInfoButton(context: context, widget: widget),
        ],
      ),
    );
  }
}
