import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  static String routeName = '/basics/10_animated_switcher';
  static String demoName = 'Animated Switcher';

  _AnimatedSwitcherDemoState createState() => _AnimatedSwitcherDemoState();
}

Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

Widget generateContainer(int kc) => Container(
  key: ValueKey<int>(kc),
  height: Random().nextDouble() * 200,
  width: Random().nextDouble() * 200,
  decoration: BoxDecoration(
    color: generateColor(),
    borderRadius: BorderRadius.circular(Random().nextDouble() * 100),
    border: Border.all(
      color: generateColor(),
      width: Random().nextDouble() * 5
    )
  ),
);

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {

  Widget container;
  int keyCount;
  
  @override
  void initState() {
    super.initState();
    keyCount = 0;
    container = generateContainer(keyCount);
  }

  @override
  void dispose() {
    super.dispose();
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AnimatedSwitcherDemo.demoName),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => setState(
              () => container = generateContainer(++keyCount),
            ),
            child: Text(
              "Change Widget",
              style: TextStyle(
                color: Theme.of(context).buttonTheme.colorScheme.onPrimary
              ),
            ),
          )
        ],

      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: container,
          transitionBuilder: (child, animation) => ScaleTransition(
            child: child,
            scale: animation
          ),
        ),
      ),
    );
  }

}