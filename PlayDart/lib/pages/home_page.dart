import 'package:PlayDart/demo/demo.dart';
import 'package:PlayDart/demo/demo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String title = 'A tour of the Dart language';

  Widget build(BuildContext context) {

    final headerStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: Text(HomePage.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('A basic Dart program', style: headerStyle),
          ),
          ...Demo.basicDemos().map((e) => DemoTile(e))
        ],
      ),
    );
  }
}