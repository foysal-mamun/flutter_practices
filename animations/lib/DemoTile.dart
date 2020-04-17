import 'package:aminations/demo.dart';
import 'package:flutter/material.dart';

class DemoTile extends StatelessWidget {
  
  final Demo demo;

  DemoTile(this.demo);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () { Navigator.pushNamed(context, demo.route); },
    );
  }  
}