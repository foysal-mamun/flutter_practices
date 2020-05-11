import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Ice Cream FTW',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.pink[50]
      ),
      home: const HomePage(title: 'Ice Cream Stores in SF'),
    );
  }
}

class HomePage extends StatefulWidget {

  const HomePage({ @required this.title });

  final String title;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Stream<QuerySnapshot> _iceCreamStores;

  @override
  void initState() {
    super.initState();
    _iceCreamStores = Firestore.instance
      .collection('ice_cream_stores')
      //.orderBy('name')
      .snapshots();

      print(_iceCreamStores);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}