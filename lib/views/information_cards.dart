import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/views/dialogs/RoleDetailsDialog.dart';

StreamSubscription<DocumentSnapshot> subscription;

class PlayerInformationCard extends StatelessWidget {
  const PlayerInformationCard({
    Key key,
    @required this.informationSubtext,
    @required this.role,
    @required this.gameID,
    @required this.name,
  }) : super(key: key);

  final List informationSubtext;
  final String role;
  final String gameID;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Align(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(20),
                                blurRadius: 10.0)
                          ]),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            showRoleDetailsDialog(context);
                          },
                          title: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(INFORMATION_TILES[index],
                                style: TextStyle(fontSize: 19)),
                          ),
                          subtitle: informationSubtext[index],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void showRoleDetailsDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return RoleDetailsDialog(role: role);
        });
  }
}

class CharacterInformationCard extends StatelessWidget {
  const CharacterInformationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
//                physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: ALL_ROLES.length,
          itemBuilder: (context, index) {
            return Align(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(20),
                                blurRadius: 10.0),
                          ]),
                      child: Card(
                        child: ListTile(
                          onTap: () {},
                          title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(ALL_ROLES[index],
                                style: TextStyle(fontSize: 20)),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(ROLE_DESCRIPTIONS[index],
                                style: TextStyle(fontSize: 17)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
