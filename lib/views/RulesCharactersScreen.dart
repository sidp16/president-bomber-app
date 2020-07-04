//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:presidentbomber/drawers.dart';
//
//void main() {
//  runApp(CharacterRulesScreen());
//}
//
//class CharacterRulesScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  ScrollController controller = ScrollController();
//  bool closeTopContainer = false;
//  double topContainer = 0;
//
//  List<Widget> itemsData = [];
//
//  void getPostsData() {
//    List<dynamic> responseList;
//    List<Widget> listItems = [];
//    responseList.forEach((post) {
//      listItems.add(Container(
//          height: 150,
//          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
//            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//          ]),
//          child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      'Bomber',
//                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                    ),
//                    Text(
//                      'Win Condition',
//                      style: const TextStyle(fontSize: 17, color: Colors.grey),
//                    ),
//                    SizedBox(
//                      height: 10,
//                    ),
//                    Text(
//                      'Allegiance',
//                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//                    )
//                  ],
//                ),
//                Image.asset(
//                  "assets/images/${post["image"]}",
//                  height: double.infinity,
//                )
//              ],
//            ),
//          )));
//    });
//    setState(() {
//      itemsData = listItems;
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    getPostsData();
//    controller.addListener(() {
//
//      double value = controller.offset/119;
//
//      setState(() {
//        topContainer = value;
//        closeTopContainer = controller.offset > 50;
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final Size size = MediaQuery.of(context).size;
//    final double categoryHeight = size.height*0.30;
//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(title: Text("Characters & Rules")),
//        drawer: HomeScreenDrawer(),
//        backgroundColor: Colors.white,
//        body: Container(
//          height: size.height,
//          child: Column(
//            children: <Widget>[
//              const SizedBox(
//                height: 10,
//              ),
//              AnimatedOpacity(
//                duration: const Duration(milliseconds: 200),
//                opacity: closeTopContainer?0:1,
//                child: AnimatedContainer(
//                    duration: const Duration(milliseconds: 200),
//                    width: size.width,
//                    alignment: Alignment.topCenter),
////                    height: closeTopContainer?0:categoryHeight
//              ),
//              Expanded(
//                  child: ListView.builder(
//                      controller: controller,
//                      itemCount: itemsData.length,
//                      physics: BouncingScrollPhysics(),
//                      itemBuilder: (context, index) {
//                        double scale = 1.0;
//                        if (topContainer > 0.5) {
//                          scale = index + 0.5 - topContainer;
//                          if (scale < 0) {
//                            scale = 0;
//                          } else if (scale > 1) {
//                            scale = 1;
//                          }
//                        }
//                        return Opacity(
//                          opacity: scale,
//                          child: Transform(
//                            transform:  Matrix4.identity()..scale(scale,scale),
//                            alignment: Alignment.bottomCenter,
//                            child: Align(
//                                heightFactor: 0.7,
//                                alignment: Alignment.topCenter,
//                                child: itemsData[index]),
//                          ),
//                        );
//                      })),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
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
//              physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: roles.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          child: ListTile(
                            onTap: () {},
                            title: Padding(
                              padding: const EdgeInsets.all(2.0),
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
                      ],
                    ),
                  );
                }))
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
        title: const Text('Characters and Rules'),
      ),
      drawer: CharacterRulesDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, size: 20),
            title: Text('Characters'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 20),
            title: Text('Rules'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
