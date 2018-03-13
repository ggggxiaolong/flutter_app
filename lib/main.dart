import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Top Lakes'),
        ),
        body: new Center(
          child: new ParentWidget(),
        ),
    ),);
  }
}

class ParentWidget extends StatefulWidget {
  @override
    _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
   void _handleTapboxChanged(bool newValue){
     setState((){
       _active = newValue;
     });
   }
  @override
    Widget build(BuildContext context) {
      return new TapBoxB(
        active: _active,
        onChange: _handleTapboxChanged,
      );
    }

}

class TapBoxB extends StatelessWidget {
  TapBoxB({ Key key, this.active: false, this.onChange}) : super(key: key);
  final bool active;
  final ValueChanged<bool> onChange;

  void _handleChange(){
    onChange(!active);
  }

  @override
    Widget build(BuildContext context) {
      return new GestureDetector(
        onTap: _handleChange,
        child: new Container(
          child: new Center(
            child: new Text(
              active? 'Active': 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          width: 200.0,
          height: 200.0,
          decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600],
          ),
        ),
      );
    }
}