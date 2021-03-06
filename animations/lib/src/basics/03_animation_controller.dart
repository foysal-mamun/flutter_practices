import 'package:flutter/material.dart';

class AnimationControllerDemo extends StatefulWidget {

  static const String routeName = '/basics/animation_controller';
  static const String demoName  = 'Animation Controller';
  
  @override
  _AnimationControllerDemoState createState() => _AnimationControllerDemoState();
}

class  _AnimationControllerDemoState extends State<AnimationControllerDemo> 
  with SingleTickerProviderStateMixin {
    
  static const Duration _duration = Duration(seconds: 1);
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: _duration)
                  ..addListener(() {
                    setState(() {
                      
                    });
                  });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AnimationControllerDemo.demoName),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                '${controller.value.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyText1,
                textScaleFactor: 1 + controller.value,
              ),
            ),
            RaisedButton(
              child: Text('Animate'),
              onPressed: () {
                if(controller.status == AnimationStatus.completed){
                  controller.reverse();
                } else {
                  controller.forward();
                }
              }
            )
          ],
        ),
      ),
    );
  }
}