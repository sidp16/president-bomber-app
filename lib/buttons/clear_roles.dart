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
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.greenAccent,
      disabledTextColor: Colors.black,
      splashColor: Colors.blueAccent,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      onPressed: () => {
        resetRoles(gameId),
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Cleared all roles!"),
            duration: Duration(seconds: 1, milliseconds: 500)))
      },
      child: Text(
        CLEAR,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}
