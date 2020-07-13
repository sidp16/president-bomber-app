import 'package:flutter/material.dart';

class NoGameFoundAlert extends StatelessWidget {
  const NoGameFoundAlert({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('the ting wasnt there'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Enter a valid id bruv or its over for you'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Dip'),
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
