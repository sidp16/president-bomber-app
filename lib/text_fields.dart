
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class gameIDTextField extends StatelessWidget {
  const gameIDTextField({
    Key key,
    @required this.gameIdTextFieldController,
  }) : super(key: key);

  final TextEditingController gameIdTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            obscureText: true,
            controller: gameIdTextFieldController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock,
                    color: Colors.grey, size: 20),
                border: OutlineInputBorder(),
                labelText: JOIN_GAME_TEXT_FIELD_HINT),
            scrollPadding: EdgeInsets.all(10.0),
          ),
        ),
        width: 210);
  }
}

class nameTextField extends StatelessWidget {
  const nameTextField({
    Key key,
    @required this.nameTextFieldController,
  }) : super(key: key);

  final TextEditingController nameTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            controller: nameTextFieldController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,
                    color: Colors.grey, size: 20),
                border: OutlineInputBorder(),
                labelText: NAME_TEXT_FIELD_HINT),
            scrollPadding: EdgeInsets.all(10.0),
            maxLength: 10,
          ),
        ),
        width: 210);
  }
}