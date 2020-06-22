import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter;

  void initState() {
    super.initState();
    counter = counter ?? 0;
  }

  void _decrementCounter(_) {
    setState(() {
      counter--;
    });
  }

  void _incrementCounter(_) {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      home: MyHomePage(
        counter: counter,
        incrementCounter: _incrementCounter,
        decrementCounter: _decrementCounter
      ),
    );
  }
}