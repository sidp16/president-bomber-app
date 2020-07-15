import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/main.dart';

import 'constants.dart';

void createGame(String gameId, String name) {
  CollectionReference data = Firestore.instance.collection(COLLECTION_NAME);
  var doc = {
    PLAYERS: [name],
    ROLES: [PRESIDENT, BOMBER],
    DISTRIBUTIONS: {},
    OWNER: name
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
    DISTRIBUTIONS: data[DISTRIBUTIONS]
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

void removeOwnerFromGame(String gameId, String name) =>
    Firestore.instance.collection(COLLECTION_NAME).document(gameId).updateData({
      PLAYERS: FieldValue.arrayRemove([name]),
      OWNER: null
    });

void addNewOwner(String gameId, List<dynamic> players) => Firestore.instance
    .collection(COLLECTION_NAME)
    .document(gameId)
    .updateData({OWNER: players.elementAt(1)});

void distributeRoles(
    String gameId, List roles, List players, BuildContext context) {
  List shuffledRoles = List.from(roles);
  List shuffledPlayers = List.from(players);
  shuffledRoles.shuffle();
  shuffledPlayers.shuffle();
  Map distributions = new HashMap<String, String>();

  for (int i = 0; i < shuffledRoles.length; i++) {
    distributions.putIfAbsent(
        shuffledPlayers[i], () => shuffledRoles[i] as String);
  }

  var newDoc = {
    PLAYERS: players,
    ROLES: roles,
    DISTRIBUTIONS: distributions,
    GAME_START: new DateTime.now(),
    GAME_END: DateTime.now().add(new Duration(minutes: 3, seconds: 2))
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

Future moveToHomePage(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyApp()));
}
