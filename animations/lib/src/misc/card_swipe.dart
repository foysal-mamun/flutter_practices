import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class CardSwipeDemo extends StatefulWidget {
  static const String routeName = '/misc/card_swipe';
  static const String demoName = 'Card Swipe';

  @override
  _CardSwipeDemoState createState() => _CardSwipeDemoState();
}

class _CardSwipeDemoState extends State<CardSwipeDemo> {

  List<String> fileNames;
  
  @override
  void initState() {
    super.initState();
    _resetCards();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _resetCards() {
    fileNames = [
      'eat_cape_town_sm.jpg',
      'eat_new_orleans_sm.jpg',
      'eat_sydney_sm.jpg',
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(CardSwipeDemo.demoName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      for (final fileName in fileNames)
                        SwipeableCard(
                          imageAssetName: fileName,
                          onSwiped: () {
                            setState(() {
                              fileNames.remove(fileName);
                            });
                          },
                        )
                    ],
                  ),
                )
              ),
              RaisedButton(
                child: const Text('Refill'),
                onPressed: () {
                  setState(() {
                    _resetCards();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SwipeableCard extends StatefulWidget {
  final String imageAssetName;
  final VoidCallback onSwiped;

  SwipeableCard({this.imageAssetName, this.onSwiped});

  _SwipeableCardState createState() => _SwipeableCardState();

}

class _SwipeableCardState extends State<SwipeableCard> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _animation;
  double _dragStartX;
  bool _isSwipingLeft = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController.unbounded(vsync: this);
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1, 0)
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onHorizontalDragStart: _dragStart,
        onHorizontalDragUpdate: _dragUpdate,
        onHorizontalDragEnd: _dragEnd,
        child: Card(widget.imageAssetName),
      ),
    );
  }

  void _dragStart(DragStartDetails details) {
    _dragStartX = details.localPosition.dx;
  }

  void _dragUpdate(DragUpdateDetails details) {
    var isSwipeingLeft = (details.localPosition.dx - _dragStartX) < 0;
    if (isSwipeingLeft) {
      _isSwipingLeft = isSwipeingLeft;
      _updateAnimation(details.localPosition.dx);
    }

    setState(() {
      _controller.value = (details.localPosition.dx - _dragStartX).abs() / context.size.width;
    });
  }

  void _updateAnimation(double dragPosition) {
    _animation = _controller.drive(Tween<Offset>(
      begin: Offset.zero,
      end: _isSwipingLeft ? Offset(-1, 0) : Offset(1, 0)
    ));
  }

  void _dragEnd(DragEndDetails details) {
    var velocity = (details.velocity.pixelsPerSecond.dx / context.size.width).abs();
    _animate(velocity: velocity);
  }

  void _animate({ double velocity = 0}) {
    var description = SpringDescription(mass: 50, stiffness: 1, damping: 1);
    var simulation = SpringSimulation(description, _controller.value, 1, velocity);

    _controller.animateWith(simulation).then<void>((_){
      widget.onSwiped();
    });
  }

}

class Card extends StatelessWidget {
  final String imageAssetName;
  
  Card(this.imageAssetName);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(imageAssetName),
            fit: BoxFit.cover
          )
        )
      ),
    );
  }
}