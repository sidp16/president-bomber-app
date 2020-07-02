import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:presidentbomber/views/PlayerGameScreen.dart';

import '../common_utils.dart';
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

//class JoinGameButton extends StatelessWidget {
//  const JoinGameButton({
//    Key key,
//    @required this.gameIdTextFieldController,
//  }) : super(key: key);
//
//  final TextEditingController gameIdTextFieldController;
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton.icon(
//        color: Colors.blue,
//        textColor: Colors.white,
//        disabledColor: Colors.grey,
//        disabledTextColor: Colors.black,
//        padding: EdgeInsets.all(8.0),
//        splashColor: Colors.blueAccent,
//        onPressed: () {
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) =>
//                      GameScreen(gameIdTextFieldController.text)));
//        },
//      // onPressed
//        icon: Icon(
//          Icons.arrow_forward,
//          size: 20,
//        ),
//        label: Text(JOIN_GAME_BUTTON_MESSAGE,
//            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)));
//  }
//}

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
      padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w900),
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