import 'package:flutter/material.dart';

class FadeTransitionDemo extends StatefulWidget {
  static const String routeName = '/basics/fade_transition';
  static const String demoName = 'Fade Transition';

  _FadeTransitionDemoState createState() => _FadeTransitionDemoState();
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;
  Animation<double> _animation;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FadeTransitionDemo.demoName)
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FadeTransition(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 300,
              ),
              opacity: _animation
            ),
            RaisedButton(
              child: Text('Animate'),
              onPressed: () => setState(() {
                _controller.animateTo(1.0).then(
                  (value) => _controller.animateBack(0.0)
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}