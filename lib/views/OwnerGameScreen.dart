import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/widgets/buttons.dart';


class OwnerGameScreen extends StatelessWidget {
  final String gameId;
  int numberConnected;

  OwnerGameScreen(this.gameId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("$gameId | $numberConnected connected")
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text(LOADING_MESSAGE);
          numberConnected = snapshot.data[PLAYERS].length;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(40.0),
                      splashColor: Colors.lightBlueAccent,
                      onPressed: () {
                        List arrayRoles = new List.from(snapshot.data[ROLES]);
                        arrayRoles.add(BLUE);

                        var newDocument = {
                          "players": snapshot.data[PLAYERS],
                          "roles": arrayRoles,
                          "time": ""
                        };

                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .setData(newDocument);
                      },
                      child: Text(
                        BLUE,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(40.0),
                      splashColor: Colors.redAccent,
                      onPressed: () {
                        List arrayRoles = new List.from(snapshot.data[ROLES]);
                        arrayRoles.add(RED);

                        var newDocument = {
                          "players": snapshot.data[PLAYERS],
                          "roles": arrayRoles,
                          "time": ""
                        };

                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .setData(newDocument);
                      },
                      child: Text(
                        RED,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.brown,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.brown,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([SNIPER.trim()])
                        });
                      },
                      child: Text(
                        SNIPER,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.pink,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.pinkAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([GAMBLER.trim()])
                        });
                      },
                      child: Text(
                        GAMBLER,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.amber,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.amberAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([MASTERMIND.trim()])
                        });
                      },
                      child: Text(
                        MASTERMIND,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.greenAccent,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([TARGET.trim()])
                        });
                      },
                      child: Text(
                        TARGET,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      disabledColor: Colors.greenAccent,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.greenAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([HERO.trim()])
                        });
                      },
                      child: Text(
                        HERO,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.grey,
                      textColor: Colors.white,
                      disabledColor: Colors.greenAccent,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.black26,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([DECOY.trim()])
                        });
                      },
                      child: Text(
                        DECOY,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.orange,
                      textColor: Colors.white,
                      disabledColor: Colors.greenAccent,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.orangeAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([HOTPOTATO.trim()])
                        });
                      },
                      child: Text(
                        HOTPOTATO,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.purple,
                      textColor: Colors.white,
                      disabledColor: Colors.greenAccent,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.purpleAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([ANARCHIST.trim()])
                        });
                      },
                      child: Text(
                        ANARCHIST,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      disabledColor: Colors.greenAccent,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(5.0),
                      splashColor: Colors.tealAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([TRAVELER.trim()])
                        });
                      },
                      child: Text(
                        TRAVELER,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              Text(""),
              Container(
                child: RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  disabledColor: Colors.greenAccent,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.fromLTRB(130, 5, 130, 5),
                  splashColor: Colors.redAccent,
                  onPressed: () {
                    Firestore.instance
                        .collection(COLLECTION_NAME)
                        .document(this.gameId)
                        .updateData({
                      ROLES: FieldValue.arrayRemove([BLUE, RED, SNIPER, GAMBLER,
                        MASTERMIND, TARGET, DECOY, HERO,
                        HOTPOTATO, ANARCHIST, TRAVELER]),
                    });
                  },
                  child: Text(
                    CLEAR,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Text(""),
              Text(snapshot.data[PLAYERS].length.toString() + " players",
                  style: TextStyle(fontSize: 25.0,)),
              Text(snapshot.data[PLAYERS].toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text(""),
              Text(snapshot.data[ROLES].toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text(snapshot.data[TIME], style: TextStyle(fontSize: 25.0)),
            ],
          );
        },
      ),
    );
  }
}
