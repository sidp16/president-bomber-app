import 'package:flutter/material.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';
import 'package:presidentbomber/views/screens/OwnerInfoScreen.dart';

class GameInfoButton extends StatelessWidget {
  const GameInfoButton({
    Key key,
    @required this.context,
    @required this.widget,
  }) : super(key: key);

  final BuildContext context;
  final OwnerGameScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: RaisedButton(
        color: Colors.green,
        textColor: Colors.white,
        disabledColor: Colors.greenAccent,
        disabledTextColor: Colors.black,
        splashColor: Colors.lightGreen,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    OwnerInfoScreen(this.widget.gameId, this.widget.name),
              ));
        },
        child: Text(
          'Game Info',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
