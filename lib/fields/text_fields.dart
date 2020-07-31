import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';

class GameIDTextField extends StatefulWidget {
  GameIDTextField({Key key, @required this.gameIdTextFieldController})
      : super(key: key);

  final TextEditingController gameIdTextFieldController;

  @override
  _GameIDTextFieldState createState() => _GameIDTextFieldState();
}

class _GameIDTextFieldState extends State<GameIDTextField> {
  bool validation = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: TextFormField(
          inputFormatters: [
            new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
          ],
          controller: widget.gameIdTextFieldController,
          decoration: InputDecoration(
            suffixIcon: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Tooltip(
                    message: "Enter Game ID!",
                    child: Icon(Icons.lock, color: Colors.grey))),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
            border: InputBorder.none,
            hintText:
                validation ? JOIN_GAME_TEXT_FIELD_HINT : 'Game ID is required!',
            errorStyle: TextStyle(height: 0),
            hintStyle: !validation ? TextStyle(color: Colors.red[700]) : null,
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              setState(() {
                validation = false;
              });
              return '';
            }
            return null;
          },
          onSaved: (String value) {
            widget.gameIdTextFieldController.text = value;
          },
          scrollPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}

class NameTextField extends StatefulWidget {
  NameTextField({
    Key key,
    @required this.nameTextFieldController,
  }) : super(key: key);

  final TextEditingController nameTextFieldController;

  @override
  _NameTextFieldState createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  bool validation = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [
            new WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9]")),
          ],
          controller: widget.nameTextFieldController,
          cursorColor: appTheme.primaryColor,
          decoration: InputDecoration(
              suffixIcon: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: Tooltip(
                      message: "Enter name!",
                      child: Icon(Icons.person, color: Colors.grey))),
              border: InputBorder.none,
              hintText: validation ? NAME_TEXT_FIELD_HINT : 'Name is required!',
              hintStyle: !validation ? TextStyle(color: Colors.red[700]) : null,
              errorStyle: TextStyle(height: 0),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0)),
          validator: (String value) {
            if (value.trim().isEmpty) {
              setState(() {
                validation = false;
              });
              return '';
            }
            return null;
          },
          onSaved: (String value) {
            widget.nameTextFieldController.text = value;
          },
        ),
      ),
    );
  }
}
