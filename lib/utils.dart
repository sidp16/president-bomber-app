import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/views/dialogs/CannotDistributeDialog.dart';

import 'constants.dart';

void createGame(String gameId, String name) {
  CollectionReference data = Firestore.instance.collection(COLLECTION_NAME);
  var doc = {
    PLAYERS: [name],
    ROLES: [PRESIDENT, BOMBER],
    DISTRIBUTIONS: {},
    STOP_GAME_BOOL: false,
    OWNER: name,
    'gameCreation': DateTime.now()
  };

  data.document(gameId.toLowerCase()).setData(doc);
}

void resetRoles(String gameId) {
  Firestore.instance
      .collection(COLLECTION_NAME)
      .document(gameId.toLowerCase())
      .updateData({
    ROLES: [PRESIDENT, BOMBER],
    STOP_GAME_BOOL: false
  });
}

void uploadRole(String gameId, String role, String name) async {
  // Get original data
  DocumentSnapshot data = await getDataForGameId(gameId.toLowerCase());

  // Add new role
  List arrayRoles = new List.from(data[ROLES]);
  arrayRoles.add(role);
  // Create new document
  var newDocument = {
    PLAYERS: data[PLAYERS],
    ROLES: arrayRoles,
    GAME_END: data[GAME_END],
    DISTRIBUTIONS: data[DISTRIBUTIONS],
    STOP_GAME_BOOL: false,
    OWNER: name,
    'gameCreation': DateTime.now()
  };

  // Upload new document
  Firestore.instance
      .collection(COLLECTION_NAME)
      .document(gameId.toLowerCase())
      .setData(newDocument);
}

Future<DocumentSnapshot> getDataForGameId(String gameId) async =>
    await Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId.toLowerCase())
        .snapshots()
        .first;

void addPlayerToGame(String gameId, String player) async => Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId.toLowerCase())
        .updateData({
      PLAYERS: FieldValue.arrayUnion([player]),
      STOP_GAME_BOOL: false,
    });

void addUniqueRole(String gameId, String role) => Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId.toLowerCase())
        .updateData({
      ROLES: FieldValue.arrayUnion([role]),
      STOP_GAME_BOOL: false,
    });

void removeOwnerFromGame(String gameId, String name) => Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId.toLowerCase())
        .updateData({
      PLAYERS: FieldValue.arrayRemove([name]),
      OWNER: null
    });

void addNewOwner(String gameId, List<dynamic> players) => Firestore.instance
    .collection(COLLECTION_NAME)
    .document(gameId.toLowerCase())
    .updateData({OWNER: players.elementAt(1)});

void distributeRoles(String gameId, List roles, List players,
    BuildContext context, String name) {
  List shuffledRoles = List.from(roles);
  List shuffledPlayers = List.from(players);
  shuffledRoles.shuffle();
  shuffledPlayers.shuffle();
  Map distributions = new HashMap<String, String>();

  checkIfOwnerCanDistribute(shuffledRoles, shuffledPlayers, context);

  for (int i = 0; i < shuffledRoles.length; i++) {
    distributions.putIfAbsent(
        shuffledPlayers[i], () => shuffledRoles[i] as String);
  }

  var newDoc = {
    PLAYERS: players,
    ROLES: roles,
    DISTRIBUTIONS: distributions,
    GAME_END: null,
    STOP_GAME_BOOL: false,
    OWNER: name,
    'gameCreation': DateTime.now()
  };

  try {
    Firestore.instance
        .collection(COLLECTION_NAME)
        .document(gameId.toLowerCase())
        .setData(newDoc);
  } on Exception catch (e) {
    print("Firebase errored while doing upload! $e");
  }
}

void checkIfOwnerCanDistribute(
    List shuffledRoles, List shuffledPlayers, BuildContext context) {
  if (shuffledRoles.length != shuffledPlayers.length) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CannotDistributeDialog();
        });
  }
}

Future moveToHomePage(BuildContext context) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyApp()));
}

Future<void> removePlayerFromGame(String gameId, String name) {
  return Firestore.instance
      .collection(COLLECTION_NAME)
      .document(gameId.toLowerCase())
      .updateData({
    PLAYERS: FieldValue.arrayRemove([name]),
  });
}

void startTimer(List players, List roles, String name, distributions,
    String gameId, stopGamePress) {
  var newDoc = {
    PLAYERS: players,
    ROLES: roles,
    DISTRIBUTIONS: distributions,
    STOP_GAME_BOOL: false,
    GAME_START: new DateTime.now(),
    GAME_END: DateTime.now().add(new Duration(minutes: 3, seconds: 2)),
    OWNER: name,
    'gameCreation': DateTime.now()
  };

  Firestore.instance
      .collection(COLLECTION_NAME)
      .document(gameId.toLowerCase())
      .setData(newDoc);
}

void resetTimer(List players, List roles, String name, distributions,
    String gameId, stopGamePress) {
  var doc = {
    PLAYERS: players,
    ROLES: roles,
    DISTRIBUTIONS: distributions,
    GAME_END: null,
    STOP_GAME_BOOL: false,
    OWNER: name,
    'gameCreation': DateTime.now()
  };

  Firestore.instance
      .collection(COLLECTION_NAME)
      .document(gameId.toLowerCase())
      .setData(doc);
}

void showAllRoles(String gameId) async => Firestore.instance
    .collection(COLLECTION_NAME)
    .document(gameId.toLowerCase())
    .updateData({STOP_GAME_BOOL: true});
