import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class RoleDetailsDialog extends StatelessWidget {
  const RoleDetailsDialog({
    Key key,
    @required this.role,
  }) : super(key: key);

  final String role;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$role Role Details'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(ROLE_DESCRIPTIONS[ALL_ROLES.indexOf(role)]),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Approve'),
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
