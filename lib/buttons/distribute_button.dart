import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';

class DistributeButton extends StatefulWidget {
  final String gameId;
  final List roles;
  final List players;
  final String name;
  final bool stopGameBool;

  const DistributeButton(
      {Key key,
      @required this.gameId,
      @required this.roles,
      @required this.players,
      @required this.name,
      @required this.stopGameBool})
      : super(key: key);

  @override
  _DistributeButtonState createState() => _DistributeButtonState();
}

class _DistributeButtonState extends State<DistributeButton> {
  bool changeValues = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 180.0,
      child: RaisedButton(
        color: (changeValues) ? Colors.red : Colors.green,
        onPressed: () {
          setState(() {
            changeValues = !changeValues;
          });
          if (changeValues) {
            distributeRoles(widget.gameId, widget.roles, widget.players,
                context, widget.name);
            // TODO: Create a notifcation for user that he / she has clicked distribute button
          } else {
            showAllRoles(widget.gameId);
          }
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            (changeValues) ? 'End Game' : DISTRIBUTE_ROLES_BUTTON_TEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
