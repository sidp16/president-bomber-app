import 'package:flutter/material.dart';

class RolesListMessage extends StatelessWidget {
  final List<dynamic> roles;

  RolesListMessage(this.roles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Center(
        child: Text(
            this.roles.toString().replaceAll("[", "").replaceAll("]", ""),
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}
