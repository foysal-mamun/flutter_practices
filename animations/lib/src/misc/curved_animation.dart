import 'package:flutter/material.dart';

class CurvedAnimationDemo extends StatefulWidget {
  static const String routeName = '/misc/curved_animation';
  static const String demoName = 'Curved Animation';

  @override
  _CurvedAnimationDemoState createState() => _CurvedAnimationDemoState();
}

class _CurvedAnimationDemoState extends State<CurvedAnimationDemo> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animationRotation;
  Animation<Offset> animationTranslation;

  static const _duration = Duration(seconds: 4);

  List<CurveChoice> curves = [
    CurveChoice(curve: Curves.bounceIn, name: 'Bounce In'),
    CurveChoice(curve: Curves.bounceOut, name: 'Bounce Out'),
    CurveChoice(curve: Curves.easeInCubic, name: 'Ease In Cubic'),
    CurveChoice(curve: Curves.easeOutCubic, name: 'Ease Out Cubic'),
    CurveChoice(curve: Curves.easeInExpo, name: 'Ease In Expo'),
    CurveChoice(curve: Curves.easeOutExpo, name: 'Ease Out Expo'),
    CurveChoice(curve: Curves.elasticIn, name: 'Elastic In'),
    CurveChoice(curve: Curves.elasticOut, name: 'Elastic Out'),
    CurveChoice(curve: Curves.easeInQuart, name: 'Ease In Quart'),
    CurveChoice(curve: Curves.easeOutQuart, name: 'Ease Out Quart'),
    CurveChoice(curve: Curves.easeInCirc, name: 'Ease In Circle'),
    CurveChoice(curve: Curves.easeOutCirc, name: 'Ease Out Circle'),
  ];

  CurveChoice selectedForwardCurve, selectedReverseCurve;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();

    selectedForwardCurve = curves[0];
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
        title: Text(CurvedAnimationDemo.demoName),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text('Select Curve for forwar motion', style: Theme.of(context).textTheme.headline6,),
          DropdownButton<CurveChoice>(
            items: curves.map((curve) {
              return DropdownMenuItem<CurveChoice>(
                value: curve, child: Text(curve.name),
              );
            }).toList(),
            value: selectedForwardCurve,
          )
        ],
      ),
    );
  }
}

class CurveChoice {
  final Curve curve;
  final String name;
  const CurveChoice({ this.curve, this.name });
}