import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class JoinGameButton extends StatelessWidget {
  final onPressed;

  const JoinGameButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: RaisedButton.icon(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: this.onPressed,
        icon: Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        label: Text(
          JOIN_GAME_BUTTON_MESSAGE,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
