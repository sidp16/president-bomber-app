import 'package:flutter/material.dart';
import 'package:presidentbomber/utils.dart';

class HostageButton extends StatelessWidget {
  final String gameId;
  final String role;
  final Color splashColor;
  final Color color;

  const HostageButton({this.gameId, this.color, this.splashColor, this.role});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(40.0),
      splashColor: Colors.redAccent,
      onPressed: () => uploadRole(gameId, role),
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
