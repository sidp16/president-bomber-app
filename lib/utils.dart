import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/main.dart';

import 'constants.dart';
import 'views/screens/RulesCharactersScreen.dart';

void createGame(String gameId, String name) {
  CollectionReference data = Firestore.instance.collection("data");
  var doc = {
    "players": [name],
    "roles": [PRESIDENT, BOMBER],
    "distributions": {},
  };

  data.document(gameId).setData(doc);
}

void resetRoles(String gameId) {
  Firestore.instance.collection(COLLECTION_NAME).document(gameId).updateData({
    ROLES: [PRESIDENT, BOMBER]
  });
}

void uploadRole(String gameId, String role) async {
  // Get original data
  DocumentSnapshot data = await getDataForGameId(gameId);

  // Add new role
  List arrayRoles = new List.from(data[ROLES]);
  arrayRoles.add(role);

  // Create new document
  var newDocument = {
    PLAYERS: data[PLAYERS],
    ROLES: arrayRoles,
    GAME_END: data[GAME_END],
    DISTRIBUTIONS: {}
  };

  // Upload new document
  Firestore.instance
      .collection(COLLECTION_NAME)
      .document(gameId)
      .setData(newDocument);
}

Future<DocumentSnapshot> getDataForGameId(String gameId) async =>
    await Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId)
        .snapshots()
        .first;

void addPlayerToGame(String gameId, String player) async =>
    Firestore.instance.collection(COLLECTION_NAME).document(gameId).updateData({
      PLAYERS: FieldValue.arrayUnion([player])
    });

void addUniqueRole(String gameId, String role) =>
    Firestore.instance.collection(COLLECTION_NAME).document(gameId).updateData({
      ROLES: FieldValue.arrayUnion([role])
    });

void removePlayerFromGame(String gameId, String name) =>
    Firestore.instance.collection(COLLECTION_NAME).document(gameId).updateData({
      PLAYERS: FieldValue.arrayRemove([name])
    });

void distributeRoles(String gameId, List roles, List players) {
  List shuffledRoles = List.from(roles);
  shuffledRoles.shuffle();

  // TODO: Write a for loop!
  var newDoc = {
    "players": players,
    "roles": [PRESIDENT, BOMBER],
    "distributions": {
      players[0]: shuffledRoles[0],
      players[1]: shuffledRoles[1],
      players[2]: shuffledRoles[2],
      players[3]: shuffledRoles[3],
      players[4]: shuffledRoles[4],
      players[5]: shuffledRoles[5],
    },
    "gameStart": new DateTime.now(),
    "gameEnd": DateTime.now().add(new Duration(minutes: 3, seconds: 2))
  };

  try {
    Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId)
        .setData(newDoc);
  } on Exception catch (e) {
    print("Firebase errored while doing upload! $e");
  }
}

Future moveToCharacterRulesScreen(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => CharacterRulesScreen()));
}

Future moveToHomePage(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyApp()));
}
