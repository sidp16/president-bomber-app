import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';

class ClearRolesButton extends StatelessWidget {
  const ClearRolesButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey,
      textColor: Colors.white,
      disabledColor: Colors.greenAccent,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      splashColor: Colors.redAccent,
      onPressed: () => resetRoles(gameId),
      child: Text(
        CLEAR,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}
