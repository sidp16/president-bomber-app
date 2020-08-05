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
    return Container(
      height: 103.0,
      width: 118.0,
      child: RaisedButton(
        color: Colors.green,
        textColor: Colors.white,
        disabledColor: Colors.greenAccent,
        disabledTextColor: Colors.black,
        splashColor: Colors.lightGreen,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        onPressed: () => {
          resetRoles(gameId),
          Scaffold.of(context).hideCurrentSnackBar(),
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Cleared all roles!"),
            duration: Duration(seconds: 1, milliseconds: 500),
            elevation: 20.0,
            behavior: SnackBarBehavior.floating,
          ))
        },
        child: Text(
          CLEAR,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
