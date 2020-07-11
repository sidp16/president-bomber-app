import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presidentbomber/views/timer/timer_message.dart';

class RoundTimer extends StatefulWidget {
  final gameEnd;
  RoundTimer(this.gameEnd);

  @override
  _RoundTimerState createState() => _RoundTimerState();
}

class _RoundTimerState extends State<RoundTimer> {
  int _counter;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) => _updateCounter());
  }

  void _updateCounter() {
    _counter = widget.gameEnd.toDate().difference(DateTime.now()).inSeconds;
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    } else {
      setState(() {
        _timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimerMessage(counter: _counter);
  }
}
