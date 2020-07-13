import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';

class PlayerInformationCard extends StatelessWidget {
  const PlayerInformationCard({
    Key key,
    @required this.informationSubtext,
  }) : super(key: key);

  final List informationSubtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(20),
                                  blurRadius: 10.0),
                            ]),
                        child: Card(
                          color: Colors.lightBlue[200],
                          child: ListTile(
                            onTap: () {},
                            title: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(INFORMATION_TILES[index],
                                  style: TextStyle(fontSize: 22)),
                            ),
                            subtitle: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: informationSubtext[index]),
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
