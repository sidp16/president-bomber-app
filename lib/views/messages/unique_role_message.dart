import 'package:flutter/material.dart';

class UniqueRoleMessage extends StatelessWidget {
  final String name;
  final String uniqueRole;

  UniqueRoleMessage(this.uniqueRole, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Text(
          // TODO: Make constants
          this.uniqueRole.toString().replaceAll("null", "None assigned yet"),
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center),
    );
  }
}
