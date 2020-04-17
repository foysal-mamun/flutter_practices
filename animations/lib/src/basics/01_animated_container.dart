import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {

  static String routeName = '/basics/01_animated_container';
  static String demoName = 'Animated Container';

  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
  
}

double generateBorderRadius() => Random().nextDouble() * 64;
double generateMargin() => Random().nextDouble() * 64;
Color generateColor()   => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {

  double margin;
  Color color;
  double borderRadius;

  void initState() {
    super.initState();
    borderRadius = generateBorderRadius();
    margin = generateMargin();
    color = generateColor();
  }

  void change() {
    setState(() {
      color = generateColor();
      borderRadius = generateBorderRadius();
      margin = generateMargin();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(AnimatedContainerDemo.demoName),),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius)
                  ),
                  duration: const Duration(milliseconds: 400),
                ),
              ),
            ),
            RaisedButton(
              child: Text('Change'),
              onPressed: () => change(),
            )
          ],
        ),
      ),
    );
  }
}