import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class UniqueRoleMessage extends StatelessWidget {
  final String name;
  final String uniqueRole;

  UniqueRoleMessage(this.uniqueRole, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Text(
          this
              .uniqueRole
              .toString()
              .replaceAll("null", WAITING_FOR_DISTRIBUTION_MESSAGE),
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center),
    );
  }
}
