import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  final String title = 'InkWell Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title)
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  final String title;

  MyHomePage({ Key key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Center(
        child: Column(
          children: [
            MyButton(),
            MyTabButton()
          ],
        )
      ),
    );
  }
}

class MyTabButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text('My Tap button'),
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('My tap tapped')));
      },
    );
  }
}

class MyButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text('Flat Button')
      ),
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Tap')));
      },
    );
  }
}