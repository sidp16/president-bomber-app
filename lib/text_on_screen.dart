import 'package:flutter/widgets.dart';
import 'package:presidentbomber/constants.dart';

class RolesLobbyMessage extends StatelessWidget {
  var playersList;
  var rolesList;

  RolesLobbyMessage(this.playersList, this.rolesList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child: Text(
          this.playersList.length.toString() +
              IN_LOBBY_MESSAGE +
              this.rolesList.length.toString() +
              NUMBER_OF_ROLES_MESSAGE,
          style: TextStyle(fontSize: 20.0,),
          textAlign: TextAlign.center),
    );
  }
}

class UniqueRoleMessage extends StatelessWidget {
  final String name;
  var uniqueRole;

  UniqueRoleMessage(this.uniqueRole, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Text(
          this.uniqueRole.toString().replaceAll("null", "None assigned yet"),
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center),
    );
  }
}

class PlayersListMessage extends StatelessWidget {
  var playersList;

  PlayersListMessage(this.playersList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Center(
        child: Text(
            this.playersList.toString().replaceAll("[", "").replaceAll("]", ""),
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class RolesListMessage extends StatelessWidget {
  var rolesList;

  RolesListMessage(this.rolesList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Center(
        child: Text(
            this.rolesList.toString().replaceAll("[", "").replaceAll("]", ""),
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class NoGameIDMessage extends StatelessWidget {
  const NoGameIDMessage({
    Key key,
    @required this.pressed,
    @required this.currentGameId,
  }) : super(key: key);

  final bool pressed;
  final String currentGameId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(pressed ? currentGameId : NO_GAME_ID_MESSAGE,
          style: TextStyle(fontSize: 18)),
    );
  }
}
