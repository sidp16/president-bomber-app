import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key key,
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
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 20,
        ),
        label: Text(BACK_BUTTON_MESSAGE,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )));
  }
}
