import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/drawers.dart';
import 'package:presidentbomber/text_fields.dart';
import 'package:presidentbomber/text_on_screen.dart';
import 'package:presidentbomber/views/PlayerGameScreen.dart';
import 'package:presidentbomber/views/OwnerGameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';

import 'common_utils.dart';

void main() {
  runApp(MaterialApp(
    title: APP_TITLE,
    home: MyApp(),
  ));
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

    return MaterialApp(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerGameScreen(
                                          gameId,
                                          nameTextFieldController.text)));
                            })),
                            Container(
                              child: JoinGameButton(onPressed: () {
                                _updateData();
                                Navigator.push(context,MaterialPageRoute(builder: (context) => PlayerGameScreen(
                                            gameIdTextFieldController.text,
                                            nameTextFieldController.text)));
                                if (snapshot.data[PLAYERS].indexOf(
                                        nameTextFieldController.text) == 0) {
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
                      NoGameIDMessage(
                          pressed: pressed, currentGameId: currentGameId),
                      gameIDTextField(
                          gameIdTextFieldController: gameIdTextFieldController),
                      nameTextField(
                          nameTextFieldController: nameTextFieldController)
                    ],
                  );
                })));
  }
}