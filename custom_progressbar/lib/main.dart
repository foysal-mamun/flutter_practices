import 'package:flutter/material.dart';

void main() => runApp(CustomProgressBar());

class CustomProgressBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Progress Bar',
      theme: ThemeData( primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: ProgressBarForm(),
          ),
        ),
      ),
    );
  }
  
}

class ProgressBarForm extends StatefulWidget {
  _ProgressBarForm createState() => _ProgressBarForm();
}

class _ProgressBarForm extends State<ProgressBarForm> {

  final _stepTextController = TextEditingController();

  double _formProgress = 0;

  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedProgessIndicator( value: _formProgress ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _stepTextController,
              decoration: InputDecoration(hintText: 'Number of steps'),
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                _formProgress += double.parse(_stepTextController.value.text);
              });
            }, 
            child: Text('Update Progress Bar'),
            color: Colors.blue,
            textColor: Colors.white,
          )
        ],
      )
    );
  }
}

class AnimatedProgessIndicator extends StatefulWidget {

  final double value;

  AnimatedProgessIndicator({ @required this.value });
  
  @override
  _AnimatedProgressIndicator createState() => _AnimatedProgressIndicator();
}

class _AnimatedProgressIndicator extends State<AnimatedProgessIndicator> 
  with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _curveAniamtion;
  Animation<Color> _colorAnimation;

  static final colors = [
    Colors.black,
    Colors.brown,
    Colors.purple,
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.amber,
    Colors.yellow,
    Colors.lime,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Colors.indigo
  ];

  @override
  void initState() {
    super.initState();

    var colorTweens = <TweenSequenceItem<Color>>[];

    for (var i = 0; i < colors.length; i++) {
      final beginColor = colors[i];
      final endColor = colors[(i+1) % colors.length];
      final width = 1 / colors.length;

      colorTweens.add(
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: beginColor, end: endColor), 
          weight: width
        )
      );

    }

    var colorTween = TweenSequence(colorTweens);

    // var colorTween = TweenSequence([
    //   TweenSequenceItem(tween: ColorTween(begin: Colors.red, end: Colors.orange), weight: 1),
    //   TweenSequenceItem(tween: ColorTween(begin: Colors.orange, end: Colors.yellow), weight: 1)
    // ]);

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
    _curveAniamtion = _controller.drive(CurveTween(curve: Curves.easeIn));
    _colorAnimation = _controller.drive(colorTween);

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller, 
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAniamtion.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value.withOpacity(0.4),
      )
    );
  }
}