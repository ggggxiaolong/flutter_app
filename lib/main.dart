import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Fade in sample',
    home: new SampleApp(),
  ));
}

class SampleApp extends StatefulWidget{
  @override _SampleAppState createState() => new _SampleAppState();
}

class _SampleAppState extends State<SampleApp> with TickerProviderStateMixin{
  AnimationController controller ;
  CurvedAnimation curve;

  @override
    void initState() {
      super.initState();
      controller = new AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
      curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(title: new Text("Fade in")),
        body: new Center(
          child: new GestureDetector(
            child: new RotationTransition(
              turns: curve,
              child: new FlutterLogo(
                size: 200.0,
              ),
            ),
            onDoubleTap: (){
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward();
              }
            },
          ),
        ),
      );
    }
}