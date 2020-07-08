import 'package:flutter/widgets.dart';
import 'package:presidentbomber/constants.dart';

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
