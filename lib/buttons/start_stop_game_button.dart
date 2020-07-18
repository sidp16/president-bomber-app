import 'package:flutter/material.dart';

class StartStopTimerButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;

  StartStopTimerButton({
    this.onPressed,
    this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      child: RaisedButton(
        color: color,
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
