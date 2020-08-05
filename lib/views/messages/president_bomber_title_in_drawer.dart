import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

// ignore: non_constant_identifier_names
Padding PresidentBomberTitleInDrawer() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Text(APP_TITLE,
        style: TextStyle(
            color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w800)),
  );
}
