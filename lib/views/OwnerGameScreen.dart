import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/testing.dart';
import 'package:presidentbomber/views/PlayerGameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';
import 'dart:collection';

class OwnerGameScreen extends StatelessWidget {
  final String gameId;
  final String name;
  int _counter = 180;
  Timer _timer;

  OwnerGameScreen(this.gameId, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$gameId | Owner Console"),
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
            return Center(
              child: CircularProgressIndicator());
          Map distributions = snapshot.data["distributions"];
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
                          "time": "",
                          "distributions": {},
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
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 103.0,
                    child: RaisedButton(
                      onPressed: () {
                        CollectionReference data =
                            Firestore.instance.collection(COLLECTION_NAME);
                        snapshot.data[ROLES].shuffle();
                        snapshot.data[PLAYERS].shuffle();
                        int playerListLength = snapshot.data[PLAYERS].length;

                        var newDoc = {
                          "players": snapshot.data[PLAYERS],
                          "roles": [PRESIDENT, BOMBER],
                          "time": 0,
                          "distributions": {
//                            for (int i = 0; playerListLength - 1 != null; i++)
//                              {
//                                snapshot.data[PLAYERS][i]: snapshot.data[ROLES]
//                                    [i],
                            snapshot.data[PLAYERS][0]: snapshot.data[ROLES][0],
                            snapshot.data[PLAYERS][1]: snapshot.data[ROLES][1],
                            snapshot.data[PLAYERS][2]: snapshot.data[ROLES][2],
                            snapshot.data[PLAYERS][3]: snapshot.data[ROLES][3],
                            snapshot.data[PLAYERS][4]: snapshot.data[ROLES][4],
                            snapshot.data[PLAYERS][5]: snapshot.data[ROLES][5],
                          }
                        };

                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .setData(newDoc);

//                        Center(
//                          child: AlertDialog(
//                            title: Text("Role"),
//                            content: Text(
//                                "Your Role: " +
//                                    snapshot.data[DISTRIBUTIONS][name].toString(),
//                                style: TextStyle(fontSize: 20.0)),
//                            actions: [
//                              FlatButton(
//                                child: Text("Approve"),
//                                onPressed: () {},
//                              ),
//                            ],
//                            elevation: 25.0,
//                          ),
//                        );
//
//                        showDialog(
//                          context: context,
//                          builder: (_) => AlertDialog(),
//                          barrierDismissible: false,
//                        );
                      },
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.red],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
//                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 120.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            DISTRIBUTE_ROLES_BUTTON_TEXT,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
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
                          "time": "",
                          "distributions": {},
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
                          fontSize: 20,
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
                  SniperButton(gameId: gameId),
                  GamblerButton(gameId: gameId),
                  MastermindButton(gameId: gameId),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TargetButton(gameId: gameId),
                  HeroButton(gameId: gameId),
                  DecoyButton(gameId: gameId),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HotPotatoButton(gameId: gameId),
                  AnarchistButton(gameId: gameId),
                  TravelerButton(gameId: gameId),
                ],
              ),
              Text(""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClearRolesButton(gameId: gameId),
                  LeaveGameButton(gameId: gameId, name: name),
                ],
              ),
              Text(""),
              Text(
                  snapshot.data[PLAYERS].length.toString() +
                      IN_LOBBY_MESSAGE +
                      snapshot.data[ROLES].length.toString() +
                      NUMBER_OF_ROLES_MESSAGE,
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              Text(""),
              Center(
                child: Text(snapshot.data[PLAYERS].toString().replaceAll("[", "").replaceAll("]", ""),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0)),
              ),
              Text(""),
//              Text(snapshot.data[TIME].toString(),
//                  style: TextStyle(fontSize: 25.0)),
              Text(snapshot.data[ROLES].toString().replaceAll("[", "").replaceAll("]", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
              Text(""),
              Text(
                  "Your Role: " + snapshot.data[DISTRIBUTIONS][name].toString(),
                  style: TextStyle(fontSize: 20.0)),
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
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      splashColor: Colors.blueGrey,
      onPressed: () {
        Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .updateData({
          PLAYERS: FieldValue.arrayRemove([this.name])
        });
      },
      child: Text(
        LEAVE_GAME,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}
