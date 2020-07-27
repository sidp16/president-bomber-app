import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/images/bomb_image.dart';
import 'package:presidentbomber/images/president_image.dart';
import 'package:presidentbomber/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(FUNNY_MESSAGES.length - 1);
    return Scaffold(
      body: buildContent(randomNumber),
    );
  }

  Stack buildContent(int randomNumber) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.blue),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[SplashScreenImages(), SplashScreenTitle()],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(backgroundColor: Colors.blue[900]),
                  SplashScreenMessage(randomNumber: randomNumber)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class SplashScreenMessage extends StatelessWidget {
  const SplashScreenMessage({
    Key key,
    @required this.randomNumber,
  }) : super(key: key);

  final int randomNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: Text(
        FUNNY_MESSAGES[randomNumber],
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),
      ),
    );
  }
}

class SplashScreenImages extends StatelessWidget {
  const SplashScreenImages({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
            child: BombImage(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50.0,
            child: PresidentImage(),
          ),
        ),
      ],
    );
  }
}

class SplashScreenTitle extends StatelessWidget {
  const SplashScreenTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
      child: Text(
        APP_TITLE,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
      ),
    );
  }
}
