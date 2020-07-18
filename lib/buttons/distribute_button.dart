import 'package:flutter/foundation.dart';
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
      width: 90.0,
      child: RaisedButton(
        color: Colors.green,
        onPressed: () {
          distributeRoles(widget.gameId, widget.roles, widget.players, context,
              widget.name);
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            DISTRIBUTE_ROLES_BUTTON_TEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
