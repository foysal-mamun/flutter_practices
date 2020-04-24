import 'package:flutter/material.dart';

class ExpandCardDemo extends StatelessWidget {
  
  static const String routeName = '/misc/expand_card';
  static const String demoName = 'Expand Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ExpandCardDemo.demoName),
      ),
      body: ExpandCard(),
    );
  }

}

class ExpandCard extends StatefulWidget {
  _ExpandCardState createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard> with SingleTickerProviderStateMixin {

  static const Duration _duration = Duration(milliseconds: 300);
  bool selected = false;

  double get size => selected ? 256 : 128;

  void toggleExpanded() {
    setState(() {
      selected = !selected;
    });
  }

  Stack loyoutBuilder(topChild, topChildKey, bottomChild, bottomChildKey) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: bottomChild,
          key: bottomChildKey,
        ),
        Positioned.fill(
          child: topChild,
          key: topChildKey,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => toggleExpanded(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: _duration,
            width: size, height: size, curve: Curves.ease,
            child: AnimatedCrossFade(
              duration: _duration,
              firstCurve: Curves.easeInOutCubic,
              secondCurve: Curves.easeInOutCubic,
              crossFadeState: selected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              layoutBuilder:  (topChild, topChildKey, bottomChild, bottomChildKey) => 
                                loyoutBuilder(topChild, topChildKey, bottomChild, bottomChildKey),
              firstChild: Image.asset(
                'eat_cape_town_sm.jpg',
                fit: BoxFit.cover,
              ), 
              secondChild: Image.asset(
                'eat_new_orleans_sm.jpg',
                fit: BoxFit.cover,
              ), 
              
            ),
          ),
        ),
      ),
    );
  }

}