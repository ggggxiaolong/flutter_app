import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          body: new CachedNetworkImage(
            imageUrl: 'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
            placeholder: new Center(child: new CircularProgressIndicator()),
            errorWidget: new Icon(Icons.error),
          ),
        ),
      );
    }
}