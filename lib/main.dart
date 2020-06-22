import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('President & Bomber!'),
              centerTitle: true,
            ),
            body: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          child: RaisedButton.icon(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {

                                setState(() {
                                  pressed = true;
                                });
                              },
                              // onPressed
                              icon: Icon(
                                Icons.add_box,
                                size: 20,
                              ),
                              label: Text('Create Game!',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  )))),
                      Container(
                          child: RaisedButton.icon(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameScreen()));
                              },
                              // onPressed
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 20,
                              ),
                              label: Text('Join Game',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900))))
                    ]),
                Container(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter ID"),
                    ),
                    width: 200),
                Text(
                  pressed ? wordPair.asPascalCase : "Nothing to show here"
                )
              ],
            )));
  }
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Screen"),
      ),
      body: StreamBuilder(
        stream:
            Firestore.instance.collection('data').document('game1').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading data...');
          return Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(snapshot.data['players'].toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text(snapshot.data['roles'].toString(),
                  style: TextStyle(fontSize: 25.0)),
              Text(snapshot.data['time'],
                  style: TextStyle(
                    fontSize: 25.0,
                  )),
              RaisedButton.icon(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  label: Text('Go back',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      )))
            ],
          );
        },
      ),
    );
  }
}
