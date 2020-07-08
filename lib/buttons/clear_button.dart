import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key key,
    @required this.gameIdTextFieldController,
    @required this.nameIdTextFieldController,
  }) : super(key: key);

  final TextEditingController gameIdTextFieldController;
  final TextEditingController nameIdTextFieldController;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.red,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.redAccent,
      onPressed: () {
        gameIdTextFieldController.clear();
        nameIdTextFieldController.clear();
        // onPressed
      },
      icon: Icon(
        Icons.clear,
        size: 20,
      ),
      label: Text("Clear",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
    );
  }
}
