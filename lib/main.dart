import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(new MaterialApp(
    title: "Dismiss Items",
    home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Dismissing Items"),
        ),
        body: new DismissApp())));

class DismissApp extends StatelessWidget {
  final List<String> _items = new List<String>.generate(20,(i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index){
        final item = _items[index];
        return new Dismissible(
          key: new Key(item),
          onDismissed: (direction){
            _items.removeAt(index);
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("$item dismissed"),));
          },
          background: new Container(color: Colors.red,),
          child: new ListTile(title: new Text("$item"),),
        );
      },
    );
  }
}
