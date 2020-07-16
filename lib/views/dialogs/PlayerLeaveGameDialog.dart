import 'package:flutter/material.dart';
import 'package:presidentbomber/utils.dart';
import 'package:presidentbomber/views/screens/PlayerGameScreen.dart';

class PlayerLeaveGameDialog extends StatelessWidget {
  const PlayerLeaveGameDialog({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final PlayerGameScreen widget;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text('Are you sure?'),
      content: new Text('Do you want to leave the game?'),
      actions: <Widget>[
        new FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: new Text('No'),
        ),
        new FlatButton(
          onPressed: () => {
            Navigator.of(context).pop(true),
            removePlayerFromGame(this.widget.gameId, this.widget.name)
          },
          child: new Text('Yes'),
        ),
      ],
    );
  }
}
