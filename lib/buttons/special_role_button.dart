import 'package:flutter/material.dart';
import 'package:presidentbomber/utils.dart';

class SpecialRoleButton extends StatelessWidget {
  final Color colour;
  final Color splashColour;
  final String role;
  final String gameId;

  const SpecialRoleButton(
      {Key key,
      @required this.gameId,
      @required this.colour,
      @required this.splashColour,
      @required this.role})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: colour,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(5.0),
      splashColor: splashColour,
      onPressed: () => addUniqueRole(gameId, role),
      child: Text(
        role,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
