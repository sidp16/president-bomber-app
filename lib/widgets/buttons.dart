import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presidentbomber/views/GameScreen.dart';

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
        label: Text('Go back',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )));
  }
}

class JoinGameButton extends StatelessWidget {
  const JoinGameButton({
    Key key,
    @required this.gameIdTextFieldController,
  }) : super(key: key);

  final TextEditingController gameIdTextFieldController;

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
          print(gameIdTextFieldController.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GameScreen(gameIdTextFieldController.text)));
        },
        // onPressed
        icon: Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        label: Text('Join Game',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)));
  }
}

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
        label: Text('Create Game!',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )));
  }
}