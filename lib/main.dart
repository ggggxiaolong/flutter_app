import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
    title: "Tap",
    home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Gesture Demo"),
        ),
        body: new TapApp())));

class TapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new GestureDetector(
      onTap: () {
        Scaffold
            .of(context)
            .showSnackBar(new SnackBar(content: new Text("Tap")));
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: new BorderRadius.circular(8.0)),
        child: new Text("My Button"),
      ),
    ));
  }
}
