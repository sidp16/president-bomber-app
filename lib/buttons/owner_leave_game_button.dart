import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';

class OwnerLeaveGameButton extends StatelessWidget {
  final String gameId;
  final String name;
  final List players;

  OwnerLeaveGameButton(this.gameId, this.name, this.players);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      child: RaisedButton(
        color: Colors.red,
        textColor: Colors.white,
        disabledColor: Colors.greenAccent,
        disabledTextColor: Colors.black,
        splashColor: Colors.redAccent,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        onPressed: () => {
          removeOwnerFromGame(gameId, name),
          moveToHomePage(context),
          addNewOwner(gameId, players),
        },
        child: Text(
          LEAVE_GAME,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
