import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;
  @override
    Widget build(BuildContext context) {
      return new Container(
        height: 80.0,
        decoration: new BoxDecoration(color: Colors.blue[500]),
        padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
        child: new Row(
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null,
            ),
            new Expanded(
              child: title,
            ),
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            )
          ],
        ),
      );
    }
}

class MyButton extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new GestureDetector(
        onTap: (){
          print('MyButton was tapped!');
        },
        child: new Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.lightGreen[500]
          ),
          child: new Center(
            child: new Text('Engage'),
          )
        ),
      );
    }
}

class MyScaffold extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new Material(
        child: new Column(
          children: <Widget>[
            new MyAppBar(
              title: new Text(
                'Example title',
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
            new Expanded(
              child: new Center(
                child: new MyButton(),
              ),
            )
          ],
        )
      );
    }
}

void main(){
  runApp(new MaterialApp(
    title: 'My app',
    home: new MyScaffold(),
  ));
}