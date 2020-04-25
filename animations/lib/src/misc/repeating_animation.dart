import 'package:flutter/material.dart';

class RepeatingAnimationDemo extends StatefulWidget {
  static const String routeName = '';
  static const String demoName = 'Repeating Animation';

  _RepeationAnimationDemoState createState() => _RepeationAnimationDemoState();
}

class _RepeationAnimationDemoState extends State<RepeatingAnimationDemo> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  Animation<BorderRadius> _borderRadius;

  @override
  void initState() {
    super.initState();

    _controller = 
      AnimationController(vsync: this, duration: const Duration(seconds: 3) )
      ..repeat(reverse: true);

    _borderRadius = BorderRadiusTween(
      begin: BorderRadius.circular(100.0),
      end: BorderRadius.circular(0.0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(RepeatingAnimationDemo.demoName),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _borderRadius, 
          builder: (context, child) {
            return Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: _borderRadius.value
              ),
            );
          }
        ),
      ),
    );
  }
}