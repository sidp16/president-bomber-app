import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        height: 60,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
          child: InkWell(
              splashColor: Colors.grey,
              onTap: onTap,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(icon,
                              size: 27.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(text, style: TextStyle(fontSize: 20.0)),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ])),
        ),
      ),
    );
  }
}