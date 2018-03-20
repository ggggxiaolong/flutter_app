import 'package:flutter/material.dart';

void main() => runApp(new TabBarDemo());

class TabBarDemo extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'TabBar Demo',
        home: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              bottom: new TabBar(
                tabs: <Widget>[
                  new Tab(icon: new Icon(Icons.directions_car),),
                  new Tab(icon: new Icon(Icons.directions_transit),),
                  new Tab(icon: new Icon(Icons.directions_bike),)
                ],
              ),
              title: new Text('Tabs Demo'),
            ),
            body: new TabBarView(
              children: <Widget>[
                new Icon(Icons.directions_car),
                new Icon(Icons.directions_transit),
                new Icon(Icons.directions_bike)
              ],
            ),
          ),
        ),
      );
    }
}