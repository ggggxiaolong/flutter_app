import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
    title: "InkWell",
    home: new Scaffold(
        appBar: new AppBar(
          title: new Text("InkWell Demo"),
        ),
        body: new TapApp())));

class TapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new InkWell(
      onTap: () {
        Scaffold.of(context).removeCurrentSnackBar(reason: SnackBarClosedReason.remove);
        Scaffold
            .of(context)
            .showSnackBar(new SnackBar(content: new Text("Tap")));
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Text("My Button"),
      ),
    ));
  }
}
