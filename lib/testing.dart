import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Error Showed if Field is Empty on Submit button Pressed'),
            TextField(
              controller: _text,
              decoration: InputDecoration(
                labelText: 'Enter the Value',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              child: Text('Submit'),
              textColor: Colors.white,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}