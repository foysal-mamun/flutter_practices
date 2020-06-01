import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Examples',
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/second': (context) => SecondPage()
      },
    );
  }
}

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mian Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: HeroItem(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailsScreen();
              }));
            },
          ),
          RaisedButton(
            child: Text('Go to second page'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return SecondPage();
              }));
            }
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            }, 
            child: Text('Go to named route Second page')
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go back'),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: GestureDetector(
        child: Center(
          child: HeroItem(),
        ),
        onTap: () { Navigator.pop(context); },
      ),
    );
  }
}


class HeroItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ImageHero',
      child: Image.network('https://picsum.photos/250?image=9'),
    );
  }
}