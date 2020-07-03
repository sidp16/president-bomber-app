import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/views/OwnerGameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';

import '../drawer.dart';

class PlayerGameScreen extends StatelessWidget {
  final String gameId;
  final String name;

  PlayerGameScreen(this.gameId, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$gameId | Player View"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.red])),
        ),
      ),
      drawer: PlayerOwnerDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.data[PLAYERS].indexOf(this.name) == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OwnerGameScreen(this.gameId, this.name)));
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            snapshot.data[PLAYERS].length.toString() +
                                IN_LOBBY_MESSAGE +
                                snapshot.data[ROLES].length.toString() +
                                NUMBER_OF_ROLES_MESSAGE,
                            style: TextStyle(
                              fontSize: 25.0,
                            )),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              snapshot.data[PLAYERS]
                                  .toString()
                                  .replaceAll("[", "")
                                  .replaceAll("]", ""),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25.0)),
                        ),
                      ),
//                      Text(snapshot.data[TIME].toString(),
//                          style: TextStyle(fontSize: 25.0)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            snapshot.data[ROLES]
                                .toString()
                                .replaceAll("[", "")
                                .replaceAll("]", ""),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Your Role: " +
                                snapshot.data[DISTRIBUTIONS][name].toString(),
                            style: TextStyle(fontSize: 25.0)),
                      ),
                      LeaveGameButton(gameId: gameId, name: name),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LeaveGameButton extends StatelessWidget {
  const LeaveGameButton({
    Key key,
    @required this.gameId,
    @required this.name,
  }) : super(key: key);

  final String gameId;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blueGrey,
      textColor: Colors.white,
      disabledColor: Colors.greenAccent,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
      splashColor: Colors.blueGrey,
      onPressed: () {
        Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .updateData({
          PLAYERS: FieldValue.arrayRemove([this.name])
        });
        Navigator.pushNamed(context, Routes.homePage);
      },
      child: Text(
        LEAVE_GAME,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}
