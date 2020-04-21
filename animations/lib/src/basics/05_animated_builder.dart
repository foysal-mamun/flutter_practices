import 'package:flutter/material.dart';

class AnimatedBuilderDemo extends StatefulWidget {
  
  static const String routeName = '/basics/animated_builder';
  static const String demoName = 'Animated Builder';

  _AnimatedBuilderDemoState createState() => _AnimatedBuilderDemoState();
}

class _AnimatedBuilderDemoState extends State<AnimatedBuilderDemo>
  with SingleTickerProviderStateMixin {

    static const beginColor = Colors.deepPurple;
    static const endColor = Colors.deepOrange;
    Duration duration = Duration(seconds: 2);

    AnimationController controller;
    Animation<Color> animation;
  
  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: duration);
    animation = ColorTween(begin: beginColor, end: endColor).animate(controller);
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
        title: Text(AnimatedBuilderDemo.demoName),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return MaterialButton(
              color: animation.value,
              child: child,
              onPressed: () {
                if(controller.status == AnimationStatus.completed) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
              }
            );
          },
          child: Text(
            'Change Color',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

}