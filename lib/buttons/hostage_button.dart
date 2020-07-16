import 'package:flutter/material.dart';
import 'package:presidentbomber/utils.dart';

class HostageButton extends StatelessWidget {
  final String gameId;
  final String role;
  final Color splashColor;
  final Color color;
  final String name;

  const HostageButton(
      {this.gameId, this.color, this.splashColor, this.role, this.name});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(40.0),
      splashColor: splashColor,
      onPressed: () => {
        uploadRole(gameId, role, name),
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Added $role Hostage!"),
            duration: Duration(seconds: 1, milliseconds: 500)))
      },
      child: Text(
        role,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
