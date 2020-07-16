import 'package:flutter/material.dart';

class NameConflictDialog extends StatelessWidget {
  const NameConflictDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Name already in target game!"),
        content: Text("Please enter a different name to avoid confusion."),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        elevation: 25.0,
        backgroundColor: Colors.white);
  }
}
