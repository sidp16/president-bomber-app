import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/widgets/buttons.dart';

class OwnerGameScreen extends StatelessWidget {
  final String gameId;

  OwnerGameScreen(this.gameId);

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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([PRESIDENT])
                        });
                      },
                      child: Text(
                        ADD_PRESIDENT_BUTTON_HINT,
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
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([BLUE_HOSTAGE])
                        });
                      },
                      child: Text(
                        ADD_BLUEHOSTAGE_BUTTON_HINT,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      splashColor: Colors.redAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([BOMBER])
                        });
                      },
                      child: Text(
                        ADD_BOMBER_BUTTON_HINT,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(10.0),
                      splashColor: Colors.redAccent,
                      onPressed: () {
                        Firestore.instance
                            .collection(COLLECTION_NAME)
                            .document(this.gameId)
                            .updateData({
                          ROLES: FieldValue.arrayUnion([RED_HOSTAGE])
                        });
                      },
                      child: Text(
                        ADD_REDHOSTAGE_BUTTON_HINT,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
              Text(""),
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
