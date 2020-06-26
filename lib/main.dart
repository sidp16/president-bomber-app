import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/views/GameScreen.dart';
import 'package:presidentbomber/widgets/buttons.dart';

import 'common_utils.dart';

final wordPair = WordPair.random();

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
        .updateData({PLAYERS: FieldValue.arrayUnion([nameTextFieldController.text])});
  }

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(APP_TITLE),
              centerTitle: true,
            ),
            body: Column(
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
                            builder: (context) => GameScreen(gameId)));
                  })),
                  Container(
                      child: RaisedButton.icon(
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          _updateData();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GameScreen(gameIdTextFieldController.text)));
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 20,
                        ),
                        label: Text(JOIN_GAME_BUTTON_MESSAGE,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                  ),
                  Container(
                    child: ClearButton(gameIdTextFieldController: gameIdTextFieldController,
                        nameIdTextFieldController: nameTextFieldController),
                  ),
                ]),
            Text(""),
            Text(pressed ? currentGameId : NO_GAME_ID_MESSAGE,
                style: TextStyle(fontSize: 18)),
            Text(""),
            Container(
                child: TextField(
                  controller: gameIdTextFieldController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: JOIN_GAME_TEXT_FIELD_HINT),
                  scrollPadding: EdgeInsets.all(10.0),
                ),
                width: 200),
            Container(
                child: TextField(
                  controller: nameTextFieldController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: NAME_TEXT_FIELD_HINT),
                  scrollPadding: EdgeInsets.all(10.0),
                ),
                width: 200)
              ],
            )));
  }
}