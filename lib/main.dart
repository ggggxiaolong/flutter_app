import 'package:flutter/material.dart';

void main() => runApp(new ImageDemo());

class ImageDemo extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'TabBar Demo',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Web Image'),
          ),
          body: new Image.network(
            'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
          ),
        ),
      );
    }
}