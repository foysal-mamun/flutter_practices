import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File read write',
      home: MyHomePage(storage: CounterStorage(),),
    );
  }
}

class MyHomePage extends StatefulWidget {

  final CounterStorage storage;

  MyHomePage({ Key key, @required this.storage }) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    widget.storage.readCounter().then((int value) {
      print('initState value = $value');
      setState(() {
        _counter = value == null ? 0 : value;
      });
    });
  }

  Future<File> _incrementCounter() {
    print('_incrementCounter value = $_counter');
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File read write'),
      ),
      body: Center (
        child: Text('Button tapped $_counter time${_counter == 1 ? '' : 's'}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      
    );
  }
}

class CounterStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('path = $path');
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();
      return int.parse(contents);

    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    print('path = $_localPath');
    return file.writeAsString('$counter');
  }

}