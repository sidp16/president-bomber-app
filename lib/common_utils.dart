import 'package:cloud_firestore/cloud_firestore.dart';

import 'constants.dart';

void checkIfGameExists(String gameId, String name) {
  return null;
}

void createGame(String gameId, String name) {
  CollectionReference data = Firestore.instance.collection("data");
  var doc = {
    "players": [name],
    "roles": [PRESIDENT,BOMBER],
    "distributions": {},
    "gameStart": DateTime.now(),
    "gameEnd": DateTime.now()
  };

  data.document(gameId).setData(doc);
}
