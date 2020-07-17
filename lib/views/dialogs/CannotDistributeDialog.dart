import 'package:flutter/material.dart';

class CannotDistributeDialog extends StatelessWidget {
  const CannotDistributeDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Cannot distribute!"),
      content: Text(
          "The number of players is not equal to the number of roles. Try again later."),
      actions: [
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: new Text('Cancel'),
        ),
      ],
    );
  }
}
