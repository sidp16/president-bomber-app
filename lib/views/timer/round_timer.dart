import 'dart:async';

import 'package:flutter/material.dart';
import 'package:presidentbomber/views/timer/timer_message.dart';

class RoundTimer extends StatefulWidget {
  final int secondsLeft;
  RoundTimer(this.secondsLeft);

  @override
  _RoundTimerState createState() => _RoundTimerState();
}

class _RoundTimerState extends State<RoundTimer> {
  int _counter;
  Timer _timer;

  @override
  void initState() {
    print("initialising state!");
    _counter = widget.secondsLeft;
    print(_counter);
    _timer = Timer.periodic(Duration(seconds: 1), (_) => updateCounter());
    print("Set timer");
    super.initState();
  }

  updateCounter() {
    print("Updating counter!");
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    } else {
      _timer.cancel();
      setState(() {
        _counter = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimerMessage(counter: _counter);
  }
}
