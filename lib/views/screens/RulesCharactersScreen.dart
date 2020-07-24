import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';

void main() => runApp(CharacterRulesScreen());

/// This Widget is the main application widget.
class CharacterRulesScreen extends StatelessWidget {
  static const String _title = 'Characters and Rules';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Characters Page",
          style: TextStyle(fontSize: 40),
        )
      ],
    ),
    Text(
      "Rules Page",
      style: TextStyle(fontSize: 40),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RULES_CHARACTERS_SCREEN_TITLE),
      ),
      drawer: CharacterRulesDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, size: 20),
            title: Text(CHARACTERS),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 20),
            title: Text(RULES),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  static Card buildCard(int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(ALL_ROLES[index],
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ),
            subtitle: Text(ROLE_DESCRIPTIONS[index]),
          ),
        ],
      ),
    );
  }
}
