import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Practice',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24 ) / 4;
    final double itemWidth = size.width / 4;
    

    final items = List<ListItem>.generate(100, (i) => 
      i % 6 == 0 ? HeadingItem('heading $i') : MessageItem('sender $i', 'body $i')
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('List Practice'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              childAspectRatio: 2,
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                return Center(
                  child: Text('Item $index', style: Theme.of(context).textTheme.headline5),
                );
              }),
            )
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('List $index', style: Theme.of(context).textTheme.headline5),
                  ),
                );
              }),
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return ListTile(
                  title: item.buildTitle(context),
                  subtitle: item.buildSubTitle(context),
                );
              },
            )
          )
        ],
      )
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildSubTitle(BuildContext context) => null;
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);
  Widget buildSubTitle(BuildContext context) => Text(body);
}