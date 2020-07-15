import 'package:flutter/material.dart';

class RolesListMessage extends StatelessWidget {
  final List<dynamic> roles;

  RolesListMessage(this.roles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 10),
      child: Center(
        child: Text(
            this.roles.toString().replaceAll("[", "").replaceAll("]", ""),
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}
