import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final appTitle = 'Tab Demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: TabDemo(title: appTitle),
    );
  }
}

class TabDemo extends StatelessWidget {
  final String title;

  const TabDemo({Key key, this.title}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    print(12);
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab( icon: Icon(Icons.directions_car) ),
              Tab( icon: Icon(Icons.directions_transit) ),
              Tab( icon: Icon(Icons.directions_bike) )
            ]
          ),
          title: Text(title),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike)
          ]
        ),
      )
    );
  }
}