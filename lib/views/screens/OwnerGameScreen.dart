import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/buttons/clear_roles.dart';
import 'package:presidentbomber/buttons/distribute_button.dart';
import 'package:presidentbomber/buttons/end_game_button.dart';
import 'package:presidentbomber/buttons/hostage_button.dart';
import 'package:presidentbomber/buttons/owner_info_button.dart';
import 'package:presidentbomber/buttons/special_role_button.dart';
import 'package:presidentbomber/buttons/start_stop_timer_button.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/utils.dart';
import 'package:presidentbomber/views/dialogs/OwnerLeaveGameDialog.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';
import 'package:presidentbomber/views/timer/round_timer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
      child: MaterialApp(
        theme: appTheme,
        home: Scaffold(
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
          body: SlidingUpPanel(
            panel: Center(child: Text("This is a sliding panel!")),
            collapsed: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Swipe up!",
                        style: TextStyle(
                            fontSize: 30.0,
//                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.keyboard_arrow_up,
                      size: 50.0,
//                      color: Colors.white,
                    )
                  ],
                ),
                decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                        colors: <Color>[Colors.lightBlue, Colors.blue]),
                    )),
            body: StreamBuilder(
              stream: Firestore.instance
                  .collection(COLLECTION_NAME)
                  .document(this.widget.gameId.toLowerCase())
                  .snapshots(),
              builder: (context, snapshot) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (snapshot.data[STOP_GAME_BOOL]) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Game has ended!"),
                              content: Text(snapshot.data[DISTRIBUTIONS]
                                  .toString()
                                  .replaceAll("{", "")
                                  .replaceAll("}", "")
                                  .replaceAll(",", "\n")),
                              actions: [
                                FlatButton(
                                    child: Text("Continue"),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true))
                              ]);
                        });
                  }
                });
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return _buildContent(snapshot);
              },
            ),
          ),
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
                roles: snapshot.data[ROLES],
                players: snapshot.data[PLAYERS],
                name: widget.name,
                stopGameBool: snapshot.data[STOP_GAME_BOOL],
              )),
          Container(
              height: 103,
              child: EndGameButton(onPressed: () {
                showAllRoles(widget.gameId);
              })),
          Container(
            height: 103,
            child: StartStopTimerButton(
                color: Colors.red,
                title: 'Reset Timer',
                onPressed: () => {
                      resetTimer(
                          snapshot.data[PLAYERS],
                          snapshot.data[ROLES],
                          this.widget.name,
                          snapshot.data[DISTRIBUTIONS],
                          this.widget.gameId,
                          snapshot.data[STOP_GAME_BOOL]),
                      // TODO: Create a notifcation for user that he / she has clicked reset timer button
                    }),
          ),
          Container(
              height: 103,
              child: StartStopTimerButton(
                  color: Colors.green,
                  title: 'Start Timer',
                  onPressed: () => {
                        startTimer(
                            snapshot.data[PLAYERS],
                            snapshot.data[ROLES],
                            this.widget.name,
                            snapshot.data[DISTRIBUTIONS],
                            this.widget.gameId,
                            snapshot.data[STOP_GAME_BOOL]),
                        // TODO: Create a notifcation for user that he / she has clicked start timer button
                      })),
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
