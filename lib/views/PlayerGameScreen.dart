import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/views/OwnerGameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';

class PlayerGameScreen extends StatelessWidget {
  final String gameId;
  final String name;

  PlayerGameScreen(this.gameId, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$gameId | Player"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.red])),
        ),
      ),
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
                      Text(
                          snapshot.data[PLAYERS].length.toString() +
                              " in lobby, " +
                              snapshot.data[ROLES].length.toString() +
                              " roles in game",
                          style: TextStyle(
                            fontSize: 25.0,
                          )),
                      Text(""),
                      Text(snapshot.data[PLAYERS].toString(),
                          style: TextStyle(fontSize: 25.0)),
                      Text(""),
                      Text(snapshot.data[ROLES].toString(),
                          style: TextStyle(fontSize: 25.0)),
                      Text(snapshot.data[TIME],
                          style: TextStyle(
                            fontSize: 25.0,
                          )),
                      Container(
                        child: RaisedButton(
                          color: Colors.blueGrey,
                          textColor: Colors.white,
                          disabledColor: Colors.greenAccent,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
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
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
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
