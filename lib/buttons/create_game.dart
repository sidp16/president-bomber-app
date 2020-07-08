import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class CreateGameButton extends StatelessWidget {
  final onPressed;

  const CreateGameButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: this.onPressed,
        // onPressed
        icon: Icon(
          Icons.add_box,
          size: 20,
        ),
        label: Text(CREATE_GAME_BUTTON_MESSAGE,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )));
  }
}
