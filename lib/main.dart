import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'Sample App',
        theme: new ThemeData(
          primarySwatch: Colors.blue
        ),
        home: new SampleAppPage(),
      );
    }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}): super(key: key);

  @override
    _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List data = [];

  bool _showLoadingDialog() {
    if (data.isEmpty) {
      return true;
    }
    return false;
  }

  Widget _getBody() {
    if (_showLoadingDialog()) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }
    return new ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int position){
            return _getRow(position);
          },
        );
  }

  @override
    void initState() {
      super.initState();
      loadData();
    }

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Sample App'),
        ),
        body: _getBody()
      );
    }

    Widget _getRow(int position){
      return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text('Row ${data[position]["title"]}'),
      );
    }

    loadData() async {
      String dataURL = "https://jsonplaceholder.typicode.com/posts";
      ReceivePort receivePort = new ReceivePort();
      await Isolate.spawn(dataLoader, receivePort.sendPort);
      SendPort sendPort = await receivePort.first;

      List msg = await sendReceive(sendPort, dataURL);

      setState((){
        data = msg;
      });
    }

    static dataLoader(SendPort sendPort) async {
      ReceivePort port = new ReceivePort();
      sendPort.send(port.sendPort);

      await for(var msg in port){
        String data = msg[0];
        SendPort replyTo = msg[1];
        http.Response response = await http.get(data);
        replyTo.send(JSON.decode(response.body));
      }
    }

    Future sendReceive(SendPort port, msg){
      ReceivePort response = new ReceivePort();
      port.send([msg, response.sendPort]);
      return response.first;
    }
}