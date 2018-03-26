import 'package:flutter/material.dart';

void main() => runApp(new LongList());

class LongList extends StatelessWidget {
  final _items = new List<String>.generate(1000, (i) => "Item $i");

  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'List Demo',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Basic List'),
          ),
          body: new Container(
            child: new ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index){
                return new ListTile(
                  title: new Text("${_items[index]}"),
                );
              },
            )
          ),
        ),
      );
    }
}