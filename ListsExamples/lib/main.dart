
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid List',
      home: Scaffold(
        appBar: AppBar(title: Text('Grid List')),
        body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Text('Item $index', style: Theme.of(context).textTheme.headline5)
          );
        })
      )
      )
    );
  }
}