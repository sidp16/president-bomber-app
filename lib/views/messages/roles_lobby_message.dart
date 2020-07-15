import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class RolesLobbyMessage extends StatelessWidget {
  final List<dynamic> players;
  final List<dynamic> roles;

  RolesLobbyMessage(this.players, this.roles);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
          this.players.length.toString() +
              IN_LOBBY_MESSAGE +
              this.roles.length.toString() +
              NUMBER_OF_ROLES_MESSAGE,
          style: TextStyle(
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center),
    );
  }
}
