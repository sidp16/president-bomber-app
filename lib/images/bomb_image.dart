import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Material BombImage() => Material(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    elevation: 30,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('images/bombpic.png', width: 90, height: 90),
    ));
