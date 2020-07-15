import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/buttons/clear_roles.dart';
import 'package:presidentbomber/buttons/distribute_button.dart';
import 'package:presidentbomber/buttons/hostage_button.dart';
import 'package:presidentbomber/buttons/owner_info_button.dart';
import 'package:presidentbomber/buttons/owner_leave_game_button.dart';
import 'package:presidentbomber/buttons/special_role_button.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("${widget.gameId} | Owner Console"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.lightBlue, Colors.blue])),
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
        buildUtilityButtons(snapshot),
      ],
    );
  }

  Padding buildTopRow(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 14, 0, 6),
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
                onPressed: () => {
                      distributeRoles(widget.gameId, snapshot.data[ROLES],
                          snapshot.data[PLAYERS], context),
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
          OwnerLeaveGameButton(
              widget.gameId, widget.name, snapshot.data[PLAYERS])
        ],
      ),
    );
  }

  Widget buildRoundTimer(BuildContext context, AsyncSnapshot snapshot) {
    print("Got new snapshot!");
    if (snapshot.data[GAME_END] != null) {
      print("Got a gameEnd ${snapshot.data[GAME_END]}!");
      int secondsLeft =
          snapshot.data[GAME_END].toDate().difference(DateTime.now()).inSeconds;
      print("$secondsLeft seconds left.");
      if (secondsLeft >= 0) {
        print("seconds left is bigger than zero");
        return RoundTimer(snapshot.data[GAME_END]);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(WAITING_FOR_TIMER_MESSAGE, style: TextStyle(fontSize: 16)),
    );
  }
}
