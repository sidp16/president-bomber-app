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
    return Container(
      height: 60,
      width: 120,
      child: FlatButton(
        color: colour,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(5.0),
        splashColor: splashColour,
        onPressed: () => {
          addUniqueRole(gameId, role),
          Scaffold.of(context).hideCurrentSnackBar(),
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Added $role! Only 1 can be added!"),
            duration: Duration(milliseconds: 850),
            elevation: 20,
            behavior: SnackBarBehavior.floating,
          )),
        },
        child: Text(
          role,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
