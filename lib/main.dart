import 'package:flutter/material.dart';

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class MixedApp extends StatelessWidget {
  final List<ListItem> items;
  MixedApp({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Mixed List",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Mixed List"),
          ),
          body: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              if (item is HeadingItem) {
                return new ListTile(
                  title: new Text(
                    item.heading,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              } else if (item is MessageItem) {
                return new ListTile(
                  title: new Text(item.sender),
                  subtitle: new Text(item.body),
                );
              }
            },
          ),
        ));
  }
}

void main() => runApp(new MixedApp(
    items: new List<ListItem>.generate(
        1000,
        (i) => i % 6 == 0
            ? new HeadingItem("Heading $i")
            : new MessageItem("Sender $i", "Message $i"))));
