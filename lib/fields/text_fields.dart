import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';

class GameIDTextField extends StatelessWidget {
  GameIDTextField({Key key, @required this.gameIdTextFieldController})
      : super(key: key);

  final TextEditingController gameIdTextFieldController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          width: 330.0,
          child: TextFormField(
            inputFormatters: [
              new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
            ],
            controller: gameIdTextFieldController,
            decoration: InputDecoration(
                prefixIcon: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: Icon(Icons.lock, color: Colors.grey)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                border: InputBorder.none,
                hintText: JOIN_GAME_TEXT_FIELD_HINT,
                hintStyle: TextStyle(fontSize: 17.0)),
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
      ),
    );
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          width: 330.0,
          child: TextFormField(
            inputFormatters: [
              new WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),
            ],
            controller: nameTextFieldController,
            cursorColor: appTheme.primaryColor,
            decoration: InputDecoration(
                prefixIcon: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: Icon(Icons.person, color: Colors.grey)),
                border: InputBorder.none,
                hintText: NAME_TEXT_FIELD_HINT,
                hintStyle: TextStyle(fontSize: 17.0),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 62.0, vertical: 14.0)),
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
          ),
        ),
      ),
    );
  }
}
