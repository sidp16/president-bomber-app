import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/drawer.dart';
import 'package:presidentbomber/text_fields.dart';
import 'package:presidentbomber/text_on_screen.dart';
import 'package:presidentbomber/views/PlayerGameScreen.dart';
import 'package:presidentbomber/views/OwnerGameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';

import 'common_utils.dart';

final wordPair = WordPair.random();

void main() {
  runApp(MaterialApp(
    title: APP_TITLE,
    home: MyApp(),
  ));
}

class Routes {
  static const String playerPage = '/player';
  static const String ownerPage = '/owner';
  static const String homePage = '/home';
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool pressed = false;
  String currentGameId = NO_GAME_ID_MESSAGE;
  final gameIdTextFieldController = TextEditingController();
  final nameTextFieldController = TextEditingController();

  final db = Firestore.instance;

  _updateData() async {
    print(gameIdTextFieldController.text);
    await db
        .collection(COLLECTION_NAME)
        .document(gameIdTextFieldController.text)
        .updateData({
      PLAYERS: FieldValue.arrayUnion([nameTextFieldController.text])
    });
  }

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    bool _validate = false;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.playerPage: (BuildContext context) => PlayerGameScreen(
              gameIdTextFieldController.text, nameTextFieldController.text),
          Routes.ownerPage: (BuildContext context) => OwnerGameScreen(
              gameIdTextFieldController.text, nameTextFieldController.text),
          Routes.homePage: (BuildContext context) => MyApp(),
        },
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(APP_TITLE),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Colors.blue, Colors.red])),
              ),
            ),
            drawer: HomeScreenDrawer(),
            body: StreamBuilder(
                stream: Firestore.instance
                    .collection(COLLECTION_NAME)
                    .document(currentGameId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(child: CreateGameButton(onPressed: () {
                              String gameId = wordPair.asPascalCase;
                              setState(() {
                                pressed = true;
                                currentGameId = gameId;
                              });
                              createGame(gameId, nameTextFieldController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OwnerGameScreen(
                                          gameId,
                                          nameTextFieldController.text)));
                            })),
                            Container(
                              child: JoinGameButton(onPressed: () {
                                _updateData();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => PlayerGameScreen(gameIdTextFieldController.text,
                                        nameTextFieldController.text)));
                                if (snapshot.data[PLAYERS].indexOf(
                                    nameTextFieldController.text) ==
                                    0) {
                                  _updateData();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerGameScreen(
                                      gameIdTextFieldController.text,
                                      nameTextFieldController.text)));
                                }
                              }),
                            ),
                            ClearButton(
                                gameIdTextFieldController:
                                    gameIdTextFieldController,
                                nameIdTextFieldController:
                                    nameTextFieldController),
                          ]),
                      NoGameIDMessage(pressed: pressed, currentGameId: currentGameId),
                      gameIDTextField(gameIdTextFieldController: gameIdTextFieldController),
                      nameTextField(nameTextFieldController: nameTextFieldController)
                    ],
                  );
                })));
  }
}