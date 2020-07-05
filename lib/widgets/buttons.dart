import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audio_cache.dart';


import '../constants.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 20,
        ),
        label: Text(BACK_BUTTON_MESSAGE,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )));
  }
}

class CreateGameButton extends StatelessWidget {
  final onPressed;

  const CreateGameButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: this.onPressed,
        // onPressed
        icon: Icon(
          Icons.add_box,
          size: 20,
        ),
        label: Text(CREATE_GAME_BUTTON_MESSAGE,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            )));
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key key,
    @required this.gameIdTextFieldController,
    @required this.nameIdTextFieldController,
  }) : super(key: key);

  final TextEditingController gameIdTextFieldController;
  final TextEditingController nameIdTextFieldController;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.red,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.redAccent,
      onPressed: () {
        gameIdTextFieldController.clear();
        nameIdTextFieldController.clear();
        // onPressed
      },
      icon: Icon(
        Icons.clear,
        size: 20,
      ),
      label: Text("Clear",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
    );
  }
}

class SniperButton extends StatelessWidget {
  const SniperButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
    );
  }
}

class ClearRolesButton extends StatelessWidget {
  const ClearRolesButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      textColor: Colors.white,
      disabledColor: Colors.greenAccent,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      splashColor: Colors.redAccent,
      onPressed: () {
        Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .updateData({
          ROLES: FieldValue.arrayRemove([
            BLUE,
            RED,
            SNIPER,
            GAMBLER,
            MASTERMIND,
            TARGET,
            DECOY,
            HERO,
            HOTPOTATO,
            ANARCHIST,
            TRAVELER
          ]),
        });
      },
      child: Text(
        CLEAR,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class TravelerButton extends StatelessWidget {
  const TravelerButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class AnarchistButton extends StatelessWidget {
  const AnarchistButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class HotPotatoButton extends StatelessWidget {
  const HotPotatoButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class DecoyButton extends StatelessWidget {
  const DecoyButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class HeroButton extends StatelessWidget {
  const HeroButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class TargetButton extends StatelessWidget {
  const TargetButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class MastermindButton extends StatelessWidget {
  const MastermindButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class GamblerButton extends StatelessWidget {
  const GamblerButton({
    Key key,
    @required this.gameId,
  }) : super(key: key);

  final String gameId;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class LeaveGameButton extends StatelessWidget {
  final String gameId;
  final String name;

  LeaveGameButton(this.gameId, this.name);

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

class RedHostageButton extends StatelessWidget {
  final String gameId;
  var playersList;
  var rolesList;

  RedHostageButton(this.gameId, this.rolesList, this.playersList);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(40.0),
      splashColor: Colors.redAccent,
      onPressed: () {
        List arrayRoles = new List.from(this.rolesList);
        arrayRoles.add(RED);

        var newDocument = {
          "players": this.playersList,
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
    );
  }
}

class DistributeButton extends StatelessWidget {
  final String gameId;
  final String name;
  var playersList;
  var rolesList;
  var uniqueRole;

  DistributeButton(this.gameId, this.name, this.rolesList, this.playersList,
      this.uniqueRole);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        CollectionReference data =
            Firestore.instance.collection(COLLECTION_NAME);
        this.rolesList.shuffle();
        this.playersList.shuffle();
        int playerListLength = this.playersList.length;

        DateTime gameStart = new DateTime.now();
        DateTime gameEnd = gameStart.add(new Duration(minutes: 3));

        var newDoc = {
          "players": this.playersList,
          "roles": [PRESIDENT, BOMBER],
          "distributions": {
            this.playersList[0]: this.rolesList[0],
            this.playersList[1]: this.rolesList[1],
            this.playersList[2]: this.rolesList[2],
            this.playersList[3]: this.rolesList[3],
            this.playersList[4]: this.rolesList[4],
            this.playersList[5]: this.rolesList[5],
          },
        "gameStart": new DateTime.now(),
      };

        Firestore.instance
            .collection(COLLECTION_NAME)
            .document(this.gameId)
            .setData(newDoc);

//        AlertDialog(
//          title: Text("Role"),
//          content: Text(
//              "Your Role: " +
//                  this.uniqueRole.toString(),
//              style: TextStyle(fontSize: 20.0)),
//          actions: [
//            FlatButton(
//              child: Text("Approve"),
//              onPressed: () {},
//            ),
//          ],
//          elevation: 25.0,
//        );
//
//        showDialog(
//          context: context,
//          builder: (_) => AlertDialog(),
//          barrierDismissible: false,
//        );
      },
      padding: EdgeInsets.all(0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.pinkAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
//                            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 120.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            DISTRIBUTE_ROLES_BUTTON_TEXT,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

class BlueHostageButton extends StatelessWidget {
  final String gameId;
  var rolesList;
  var playersList;

  BlueHostageButton(this.gameId, this.rolesList, this.playersList);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.lightBlue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(40.0),
      splashColor: Colors.lightBlueAccent,
      onPressed: () {
        List arrayRoles = new List.from(this.rolesList);
        arrayRoles.add(BLUE);

        var newDocument = {
          "players": this.playersList,
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
    );
  }
}

class JoinGameButton extends StatelessWidget {
  final onPressed;

  const JoinGameButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: this.onPressed,
      icon: Icon(
        Icons.arrow_forward,
        size: 20,
      ),
      label: Text(
        JOIN_GAME_BUTTON_MESSAGE,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }
}
