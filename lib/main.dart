import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String label;
  CustomeButton(this.label);
  @override
    Widget build(BuildContext context) {
      return new RaisedButton(
        onPressed: (){print('onTap');},
        child: new Text(label),
      );
    }
}

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text('CustomeButton'),
    ),
    body: new Center(
      child: new CustomeButton('Hello'),
    ),
  );
}

void main() => runApp(new MaterialApp(home: new DemoApp()));
