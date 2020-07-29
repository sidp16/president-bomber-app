import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/views/dialogs/NoRoleFoundDialog.dart';
import 'package:presidentbomber/views/dialogs/PlayerLeaveGameDialog.dart';
import 'package:presidentbomber/views/dialogs/RoleDetailsDialog.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';
import 'package:presidentbomber/views/messages/players_list_message.dart';
import 'package:presidentbomber/views/messages/roles_list_message.dart';
import 'package:presidentbomber/views/messages/roles_lobby_message.dart';
import 'package:presidentbomber/views/messages/unique_role_message.dart';
import 'package:presidentbomber/views/screens/OwnerGameScreen.dart';
import 'package:presidentbomber/views/timer/round_timer.dart';

class PlayerGameScreen extends StatefulWidget {
  final String gameId;
  final String name;

  PlayerGameScreen(this.gameId, this.name);

  @override
  _PlayerGameScreenState createState() => _PlayerGameScreenState();
}

class _PlayerGameScreenState extends State<PlayerGameScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => PlayerLeaveGameDialog(widget: widget),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("${widget.gameId.toLowerCase()} | Player View"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.lightBlue, Colors.blue])),
          ),
        ),
        drawer: PlayerDrawer(widget.gameId, widget.name),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection(COLLECTION_NAME)
              .document(this.widget.gameId.toLowerCase())
              .snapshots(),
          builder: (context, snapshot) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (snapshot.data[STOP_GAME_BOOL]) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Game has ended!"),
                          content: Text(snapshot.data[DISTRIBUTIONS]
                              .toString()
                              .replaceAll("{", "")
                              .replaceAll("}", "")
                              .replaceAll(",", "\n")),
                          actions: [
                            FlatButton(
                                child: Text("Continue"),
                                onPressed: () =>
                                    Navigator.of(context).pop(true))
                          ]);
                    });
              }
            });
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            List informationSubtext = [
              RolesLobbyMessage(snapshot.data[PLAYERS], snapshot.data[ROLES]),
              PlayersListMessage(snapshot.data[PLAYERS]),
              RolesListMessage(snapshot.data[ROLES]),
              UniqueRoleMessage(
                  snapshot.data[DISTRIBUTIONS][widget.name], widget.name),
              buildRoundTimer(context, snapshot)
            ];

            if (snapshot.data[OWNER] == this.widget.name) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OwnerGameScreen(
                          this.widget.gameId, this.widget.name)));
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildCard(informationSubtext, 0,
                    snapshot.data[DISTRIBUTIONS][widget.name]),
                buildCard(informationSubtext, 1,
                    snapshot.data[DISTRIBUTIONS][widget.name]),
                buildCard(informationSubtext, 2,
                    snapshot.data[DISTRIBUTIONS][widget.name]),
                buildCard(informationSubtext, 3,
                    snapshot.data[DISTRIBUTIONS][widget.name]),
                buildCard(informationSubtext, 4,
                    snapshot.data[DISTRIBUTIONS][widget.name]),
              ],
            );
          },
        ),
      ),
    );
  }

  Center buildCard(List informationSubtext, int index, String role) {
    return Center(
      child: Container(
        width: 380,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  showRoleDetailsDialog(context, role);
                },
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(INFORMATION_TILES[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ),
                subtitle: informationSubtext[index],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRoundTimer(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data[GAME_END] != null) {
      int secondsLeft =
          snapshot.data[GAME_END].toDate().difference(DateTime.now()).inSeconds;
      if (secondsLeft > 0) {
        return RoundTimer(snapshot.data[GAME_END]);
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child:
              Text(WAITING_FOR_TIMER_MESSAGE, style: TextStyle(fontSize: 18))),
    );
  }

  Future<void> showRoleDetailsDialog(BuildContext context, String role) async {
    final roleDetailsCheck = await Firestore.instance
        .collection(COLLECTION_NAME)
        .document(this.widget.gameId.toLowerCase())
        .get();

    if (roleDetailsCheck.data[DISTRIBUTIONS][this.widget.name] == null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return NoRoleFoundDialog();
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return RoleDetailsDialog(role: role);
          });
    }
  }
}
