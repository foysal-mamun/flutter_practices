import 'package:aminations/DemoTile.dart';
import 'package:aminations/demo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    final headerStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Sample'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Basics', style: headerStyle,),
          ),
          ...Demo.basicDemos().map((e) => DemoTile(e)),
          ListTile(
            title: Text('Misc', style: headerStyle,)
          )
        ],
      ),
    );
  }
}