import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/drawers.dart';
import 'package:presidentbomber/roles_and_descriptions.dart';

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
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
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
        ),
      ],
    ),
    Text(
      'Rules',
      style: optionStyle,
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
}
