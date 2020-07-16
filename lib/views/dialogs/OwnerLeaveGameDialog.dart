import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/utils.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';

class OwnerLeaveGameDialog extends StatelessWidget {
  const OwnerLeaveGameDialog({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final OwnerGameScreen widget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.widget.gameId)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          return AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to leave the game?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  removeOwnerFromGame(this.widget.gameId, this.widget.name);
                  addNewOwner(this.widget.gameId, snapshot.data[PLAYERS]);
                },
                child: new Text('Yes'),
              ),
            ],
          );
        });
  }
}
