import 'package:cloud_firestore/cloud_firestore.dart';

void checkIfGameExists(String gameId){
  return null;
}

void createGame(String gameId) {
  CollectionReference data = Firestore.instance.collection("data");
  var doc = {
    "players": [""],
    "roles": [""],
    "time": "",
  };

  data.document(gameId).setData(doc);
}