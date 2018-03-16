import 'package:flutter/material.dart';

void main(){
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'Sample App',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new SampleAppPage(),
      );
    }
}

class SampleAppPage extends StatefulWidget {
  @override
    _SampleAppPage createState() => new _SampleAppPage();
}

class _SampleAppPage extends State<SampleAppPage> {
  bool toggle = true;

  void _toggle(){
    setState((){
      toggle = !toggle;
    });
  }

  _getToggleChild(){
    if(toggle){
      return new Text('Toggle One');
    } else {
      return new MaterialButton(onPressed: null, child: new Text('Toggle Two'),);
    }
  }
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Sample App'),
        ),
        body: new Center(
          child: _getToggleChild(),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _toggle,
          tooltip: 'Update Text',
          child: new Icon(Icons.update),
        ),
      );
    }
}