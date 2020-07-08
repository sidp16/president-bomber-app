import 'package:flutter/material.dart';

class TimerMessage extends StatelessWidget {
  const TimerMessage({
    Key key,
    @required int counter,
  }) : _counter = counter, super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('$_counter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
    );
  }
}
