import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsCardDragDemo extends StatelessWidget {
  static const String routeName = '/misc/physics_card';
  static const String demoName = 'Physics Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PhysicsCardDragDemo.demoName),
      ),
      body: DraggableCard(
        child: FlutterLogo( size: 128 )
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;
  DraggableCard({this.child});
  
  @override
  _DraggablCardState createState() => _DraggablCardState();
}

class _DraggablCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {

  var _dragAligment = Alignment.center;
  AnimationController _controller;
  Animation<Alignment> _animation;

  final _spring = const SpringDescription(
    mass:  100,
    stiffness: 1000,
    damping: 0.7
  );

  @override  
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
    ..addListener(() {
      setState(() {
        _dragAligment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _normalizeVelocity(Offset velocity, Size size) {
    final normalizeVelocity = Offset(
      velocity.dx / size.width, 
      velocity.dy / size.height
    );

    return -normalizeVelocity.distance;
  }

  void _runAnimation(Offset velocity, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAligment,
        end: Alignment.center
      )
    );

    final simulation = SpringSimulation(_spring, 0, 2, _normalizeVelocity(velocity, size));

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Align(
        alignment: _dragAligment,
        child: Card(
          child: widget.child,
        ),
      ),
      onPanStart: (details) => _controller.stop(canceled: true),
      onPanUpdate: (details) => setState(() =>
        _dragAligment += Alignment(
          details.delta.dx / (size.width / 2),
          details.delta.dy / (size.height / 2 )
        )
      ),
      onPanEnd: (details) => _runAnimation( details.velocity.pixelsPerSecond, size),
    );
  }
}