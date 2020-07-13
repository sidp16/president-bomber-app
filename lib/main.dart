import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/buttons/clear_button.dart';
import 'package:presidentbomber/buttons/create_game.dart';
import 'package:presidentbomber/buttons/join_game_button.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/fields/text_fields.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';
import 'package:presidentbomber/views/messages/no_gameid_message.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';
import 'package:presidentbomber/views/screens/PlayerGameScreen.dart';

import 'utils.dart';

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

  bool nameIsEmpty() => nameTextFieldController.text.isEmpty;

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
                  return _buildContent(wordPair, context, snapshot);
                })));
  }

  Column _buildContent(
      WordPair wordPair, BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      children: <Widget>[
        buildUtilityButtons(wordPair, context, snapshot),
        NoGameIDMessage(pressed: pressed, currentGameId: currentGameId),
        GameIDTextField(gameIdTextFieldController: gameIdTextFieldController),
        NameTextField(
            nameTextFieldController: nameTextFieldController,
            validate: nameIsEmpty())
      ],
    );
  }

  Row buildUtilityButtons(
      WordPair wordPair, BuildContext context, AsyncSnapshot snapshot) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(child: CreateGameButton(onPressed: () {
            checkIfNameEnteredWhenCreatingGame(wordPair, context);
          })),
          Container(
            child: JoinGameButton(onPressed: () {
              checkIfNameEnteredWhenJoiningGame(snapshot, context);
            }),
          ),
          ClearButton(
              gameIdTextFieldController: gameIdTextFieldController,
              nameIdTextFieldController: nameTextFieldController),
        ]);
  }

  void checkIfNameEnteredWhenJoiningGame(
      AsyncSnapshot snapshot, BuildContext context) {
    print("the name text field is ${nameIsEmpty()}");

    if ((snapshot.data[PLAYERS].indexOf(nameTextFieldController.text) == 0) &&
        !nameIsEmpty()) {
      print("THIS IF WORKS");
      addPlayer();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OwnerGameScreen(
                  gameIdTextFieldController.text.trim(),
                  nameTextFieldController.text.trim())));
    } else if (!nameIsEmpty()) {
      print("THIS ELSE IS BEING INITIATED");
      addPlayer();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerGameScreen(
                  gameIdTextFieldController.text.trim(),
                  nameTextFieldController.text.trim())));
    }
  }

  void checkIfNameEnteredWhenCreatingGame(
      WordPair wordPair, BuildContext context) {
    String gameId = wordPair.asPascalCase;
    setState(() {
      pressed = true;
      currentGameId = gameId;
    });

    if (nameIsEmpty()) {
      setState(() {
        currentGameId = NO_GAME_ID_MESSAGE;
      });
    } else {
      createGame(gameId, nameTextFieldController.text.trim());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OwnerGameScreen(gameId, nameTextFieldController.text)));
    }
  }

  void addPlayer() => addPlayerToGame(
      gameIdTextFieldController.text, nameTextFieldController.text);
}
