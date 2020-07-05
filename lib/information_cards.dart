import 'package:flutter/material.dart';

import 'roles_and_descriptions.dart';

class PlayerInformationCard extends StatelessWidget {
  const PlayerInformationCard({
    Key key,
    @required this.informationTitles,
    @required this.informationSubtext,
  }) : super(key: key);

  final List informationTitles;
  final List informationSubtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Expanded(
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(20),
                                  blurRadius: 10.0),
                            ]),
                        child: Card(
                          child: ListTile(
                            onTap: () {},
                            title: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(informationTitles[index], style: TextStyle(fontSize: 22)
                              ),
                            ),
                            subtitle: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: informationSubtext[index]
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
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
          itemCount: roles.length,
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
                          borderRadius:
                          BorderRadius.all(Radius.circular(50)),
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
                            child: Text(roles[index],
                                style: TextStyle(fontSize: 20)),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(roleDescriptions[index],
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
