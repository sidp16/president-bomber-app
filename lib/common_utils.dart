import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

void checkIfGameExists(String gameId, String name){
  return null;
}

void createGame(String gameId, String name) {
  CollectionReference data = Firestore.instance.collection("data");
  var doc = {
    "players": [name],
    "roles": [],
    "time": "",
  };

  data.document(gameId).setData(doc);
}