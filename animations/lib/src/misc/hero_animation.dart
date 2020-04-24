import 'package:flutter/material.dart';

class HeroAnimationDemo extends StatelessWidget {
  static const String routeName = '/misc/hero_animation';
  static const String demoName = 'Hero Animation';

  final String tag = 'hero-page-child';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HeroAnimationDemo.demoName),
      ),
      body: GestureDetector(
        child: Hero(
          tag: this.tag, 
          child: _createHeroContainer(
            size: 50.0,
            color: Colors.grey[300]
          )
        ),
        onTap: () => Navigator.of(context)
          .push<void>(MaterialPageRoute(
            builder: (context) => HeroPage(
              this.tag, 
              _createHeroContainer(
                size: 600.0,
                color: Colors.white
              )
            )
          )),

      ),
    );
  }
}

class HeroPage extends StatelessWidget {
  final String tag;
  final Widget herocontainer;
  
  HeroPage(this.tag, this.herocontainer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(this.tag),
      ),
      body: Center(
        child: Hero(
          tag: this.tag, 
          child: this.herocontainer
        ),
      ),
    );
  }
}

StatelessWidget _createHeroContainer({ double size, Color color }) {
  return Container(
    height: size,
    width: size,
    padding: size < 100.0 ? EdgeInsets.all(10.0) : EdgeInsets.all(50.0),
    margin: size < 100.0 ? EdgeInsets.all(10.0) : EdgeInsets.all(0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color
    ),
    child: Image.asset(
      'own.png',
    ),
  );
}