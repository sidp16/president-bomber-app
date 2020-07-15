import 'package:flutter/material.dart';

class PlayersListMessage extends StatelessWidget {
  final List<dynamic> players;

  PlayersListMessage(this.players);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
      child: Center(
        child: Text(
            this.players.toString().replaceAll("[", "").replaceAll("]", ""),
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}
