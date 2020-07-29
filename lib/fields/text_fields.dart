import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presidentbomber/constants.dart';

class GameIDTextField extends StatelessWidget {
  GameIDTextField({Key key, @required this.gameIdTextFieldController})
      : super(key: key);

  final TextEditingController gameIdTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
            inputFormatters: [
              new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
            ],
            controller: gameIdTextFieldController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 20),
              border: OutlineInputBorder(),
              labelText: JOIN_GAME_TEXT_FIELD_HINT,
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Game ID is required!';
              }
              return null;
            },
            onSaved: (String value) {
              gameIdTextFieldController.text = value;
            },
            scrollPadding: EdgeInsets.all(10.0),
          ),
        ),
        width: 210);
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
    @required this.nameTextFieldController,
  }) : super(key: key);

  final TextEditingController nameTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
            inputFormatters: [
              new WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),
            ],
            controller: nameTextFieldController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person, color: Colors.grey, size: 20),
              border: OutlineInputBorder(),
              labelText: NAME_TEXT_FIELD_HINT,
            ),
            validator: (String value) {
              if (value.trim().isEmpty) {
                return 'Name is required!';
              }
              return null;
            },
            onSaved: (String value) {
              nameTextFieldController.text = value;
            },
            scrollPadding: EdgeInsets.all(10.0),
            maxLength: 15,
          ),
        ),
        width: 210);
  }
}
