import 'package:flutter/material.dart';

void main(){
  runApp(new FadeAppTest());
}

class FadeAppTest extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'Fade Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue
        ),
        home: new FadeTest(title: 'Fade Demo',),
      );
    }
}

class FadeTest extends StatefulWidget {
  FadeTest({Key key, this.title}): super(key: key); 
  final String title;
  @override
    _FadeTestState createState() => new _FadeTestState();
}

class _FadeTestState extends State<FadeTest> with TickerProviderStateMixin {
  AnimationController controler;
  CurvedAnimation curve;
  @override
    void initState() {
      controler = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
      curve = new CurvedAnimation(parent: controler, curve: Curves.easeIn);
      super.initState();
    }
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Container(
            child: new FadeTransition(
              opacity: curve,
              child: new FlutterLogo(
                size: 100.0,
              ),
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Fade',
          child: new Icon(Icons.brush),
          onPressed: (){
            controler.forward();
          }
        ),
      );
    }
}