import 'package:flutter/material.dart';

void main() => runApp(new SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'SnackBar Demo',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('SnackBar Demo'),
          ),
          body: new SnackBarPage(),
        ),
      );
    }
}

class SnackBarPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new Center(
        child: new RaisedButton(
          child: new Text('Show SnackBar'),
          onPressed: (){
            final SnackBar snackBar = new SnackBar(
              content: new Text('Yay! A SnackBar!'),
              action: new SnackBarAction(
                label: 'Undo',
                onPressed:(){
                  print('Undo');
                },
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
}