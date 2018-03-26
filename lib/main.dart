import 'package:flutter/material.dart';

void main() => runApp(new GrideApp());

class GrideApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: "Gride List",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Gride App"),
          ),
          body: new GridView.count(
            crossAxisCount: 2,
            children: new List.generate(
              100, 
              (i) => new Center(
                child: new Text(
                  "Item $i",
                  style: Theme.of(context).textTheme.headline,
                ),
              )
            ),
          ),
        ),
      );
    }
}