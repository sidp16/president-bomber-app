import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/widgets/buttons.dart';

class GameScreen extends StatelessWidget {
  final String gameId;

  GameScreen(this.gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameId),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text(LOADING_MESSAGE);

          return Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(snapshot.data[PLAYERS].toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text(snapshot.data[ROLES].toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text(snapshot.data[TIME],
                  style: TextStyle(
                    fontSize: 25.0,
                  )),
              GoBackButton()
            ],
          );
        },
      ),
    );
  }
}