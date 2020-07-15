import 'package:flutter/material.dart';

class NoRoleFoundDialog extends StatelessWidget {
  const NoRoleFoundDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Game has not started!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('The creator has not distributed the roles yet.'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      elevation: 25.0,
      backgroundColor: Colors.white,
    );
  }
}
