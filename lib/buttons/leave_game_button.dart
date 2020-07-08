import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';

class LeaveGameButton extends StatelessWidget {
  final String gameId;
  final String name;

  LeaveGameButton(this.gameId, this.name);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey,
      textColor: Colors.white,
      disabledColor: Colors.greenAccent,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      splashColor: Colors.blueGrey,
      onPressed: () => removePlayerFromGame(gameId, name),
      child: Text(
        LEAVE_GAME,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}
