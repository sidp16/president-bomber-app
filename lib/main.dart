import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/CustomShapeClipper.dart';
import 'package:presidentbomber/buttons/clear_button.dart';
import 'package:presidentbomber/buttons/create_game.dart';
import 'package:presidentbomber/buttons/join_game_button.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/fields/text_fields.dart';
import 'package:presidentbomber/views/dialogs/NameConflictDialog.dart';
import 'package:presidentbomber/views/dialogs/NoGameFoundDialog.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';
import 'package:presidentbomber/views/screens/PlayerGameScreen.dart';
import 'package:presidentbomber/views/screens/SplashScreen.dart';

import 'utils.dart';

void main() {
  runApp(MaterialApp(
    title: APP_TITLE,
    home: SplashScreen(),
  ));
}

ThemeData appTheme = ThemeData(primaryColor: Colors.blue, fontFamily: 'Oxygen');

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
  final GlobalKey<FormState> _gameIdFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            drawer: HomeScreenDrawer(),
            body: StreamBuilder(
                stream: Firestore.instance
                    .collection(COLLECTION_NAME)
                    .document(currentGameId.toLowerCase())
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return _buildContent(wordPair, context, snapshot);
                })));
  }

  Stack _buildContent(
      WordPair wordPair, BuildContext context, AsyncSnapshot snapshot) {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.blue, Colors.lightBlue])),
            child: Column(children: <Widget>[
              SizedBox(height: 40.0),
              Text("Welcome to \nTwo Rooms And a Boom!",
                  style: TextStyle(fontSize: 26.0, color: Colors.white),
                  textAlign: TextAlign.center),
//              NoGameIDMessage(pressed: pressed, currentGameId: currentGameId),
              SizedBox(height: 30.0),
              Form(
                  key: _nameFormKey,
                  child: NameTextField(
                      nameTextFieldController: nameTextFieldController)),
              SizedBox(height: 30.0),
              Form(
                key: _gameIdFormKey,
                child: GameIDTextField(
                    gameIdTextFieldController: gameIdTextFieldController),
              ),
            ])),
      ),
      Container(
        child: Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height - 350),
          buildUtilityButtons(wordPair, context, snapshot),
          SizedBox(height: 20),
          CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.38,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  scrollDirection: Axis.horizontal),
              items: [0, 1, 2, 3, 4, 5].map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Center(
                          child: Text('Page $i',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))));
                });
              }).toList()),
        ]),
      )
    ]);
  }

  Row buildUtilityButtons(
      WordPair wordPair, BuildContext context, AsyncSnapshot snapshot) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(child: CreateGameButton(onPressed: () {
            validateFieldAndCreateGame(wordPair);
          })),
          Container(
            child: JoinGameButton(onPressed: () {
              validateFieldsAndJoinGame(context, snapshot);
            }),
          ),
          ClearButton(
              gameIdTextFieldController: gameIdTextFieldController,
              nameIdTextFieldController: nameTextFieldController),
        ]);
  }

  Future<void> validateFieldsAndJoinGame(
      BuildContext context, AsyncSnapshot snapshot) async {
    {
      if (!_gameIdFormKey.currentState.validate() &&
          !_nameFormKey.currentState.validate()) {
        return;
      }
      _gameIdFormKey.currentState.save();
      _nameFormKey.currentState.save();

      final dataChecks = await Firestore.instance
          .collection(COLLECTION_NAME)
          .document(gameIdTextFieldController.text.trim().toLowerCase())
          .get();

      if (dataChecks == null || !dataChecks.exists) {
        return buildNoGameFoundDialog(context);
      } else {
        addPlayerToGame(gameIdTextFieldController.text.trim(),
            nameTextFieldController.text.trim());
      }

      if (dataChecks.data[PLAYERS]
          .toString()
          .toLowerCase()
          .contains(nameTextFieldController.text.trim().toLowerCase())) {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return NameConflictDialog();
            });
      }

      if (dataChecks.data[OWNER] == nameTextFieldController.text.trim() ||
          dataChecks.data[OWNER] == null) {
        addOwnerIfGameEmpty();
        return moveToOwnerScreen(context);
      } else {
        return moveToPlayerScreen(context);
      }
    }
  }

  Future moveToPlayerScreen(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PlayerGameScreen(
                  gameIdTextFieldController.text.trim(),
                  nameTextFieldController.text.trim(),
                )));
  }

  void moveToOwnerScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OwnerGameScreen(
                  gameIdTextFieldController.text.trim(),
                  nameTextFieldController.text.trim(),
                )));
  }

  void addOwnerIfGameEmpty() {
    String name = nameTextFieldController.text.trim();
    Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameIdTextFieldController.text.trim().toLowerCase())
        .updateData({OWNER: '$name'});
  }

  Future<void> buildNoGameFoundDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return NoGameFoundAlert();
      },
    );
  }

  void validateFieldAndCreateGame(WordPair wordPair) {
    if (!_nameFormKey.currentState.validate()) {
      gameIdTextFieldController.clear();
      _gameIdFormKey.currentState.reset();
      return;
    }

    String gameId = wordPair.asPascalCase;
    setState(() {
      pressed = true;
      currentGameId = gameId;
    });

    gameIdTextFieldController.clear();
    _gameIdFormKey.currentState.reset();
    _nameFormKey.currentState.save();
    createGame(gameId.toLowerCase(), nameTextFieldController.text.trim());

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OwnerGameScreen(
                currentGameId, nameTextFieldController.text.trim())));
  }
}
