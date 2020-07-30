import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presidentbomber/constants.dart';
import 'package:presidentbomber/main.dart';
import 'package:presidentbomber/views/drawer/drawers.dart';

/// This Widget is the main application widget.
class CharacterRulesScreen extends StatelessWidget {
  static const String _title = 'Characters and Rules';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: appTheme,
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
      children: [characterCarousel(500.0)],
    ),
    Text(
      "Rules Page",
      style: TextStyle(fontSize: 40),
    ),
  ];

  static CarouselSlider characterCarousel(double height) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
      items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return carouselCard(
                MediaQuery.of(context).size.width,
                context,
                i,
                (i == 0 || i == 2)
                    ? Colors.red
                    : (i == 1 || i == 3)
                        ? Colors.blue
                        : Colors.deepPurpleAccent,
                (i == 0 || i == 1)
                    ? Icons.stars
                    : (i == 2 || i == 3)
                        ? Icons.person_outline
                        : (i == 4) ? Icons.casino : Icons.help,
                (i > 3)
                    ? "This is a unique role!"
                    : "This is a team based role!");
          },
        );
      }).toList(),
    );
  }

  static Container carouselCard(double width, BuildContext context, int i,
      Color color, IconData icon, String message) {
    return Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleAndIcon(message, icon, i),
              roleDescription(i, context),
            ],
          ),
        ));
  }

  static Column roleDescription(int i, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 7, 15, 10),
          child: Text(ROLE_DESCRIPTIONS[i],
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 33,
                  color: Colors.white)),
        ),
      ],
    );
  }

  static Row titleAndIcon(String message, IconData icon, int i) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Tooltip(
                message: message,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 50.0,
                )),
          ),
        ),
        Text(
          ALL_ROLES[i],
          style: TextStyle(
              fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

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
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
