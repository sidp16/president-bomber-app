import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class StartGameButton extends StatelessWidget {
  final Function onPressed;

  StartGameButton({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 180.0,
      child: RaisedButton(
        color: Colors.green,
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            START_GAME_BUTTON_TEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
