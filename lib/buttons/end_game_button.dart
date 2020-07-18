import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class EndGameButton extends StatelessWidget {
  final Function onPressed;

  EndGameButton({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      child: RaisedButton(
        color: Colors.red,
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            END_GAME_BUTTON_TEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
