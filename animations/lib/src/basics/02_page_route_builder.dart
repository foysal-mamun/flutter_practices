import 'package:flutter/material.dart';

class PageRouteBuilderDemo extends StatelessWidget {

  static String routeName = '/basic/page_route_builder';
  static String demoName = 'Page Route Builder';
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(PageRouteBuilderDemo.demoName),),
      body: Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () {
            Navigator.of(context).push<void>(_createRoute());
          }
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder<SlideTransition>(
    pageBuilder: (context, animation, secondaryAnimation) => _Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var tween = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero);
      var curveTween = CurveTween(curve: Curves.ease);

      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    },
  );
}

class _Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'),),
      body: Center(
        child: Text('Page 2!', style: Theme.of(context).textTheme.headline2,)
      ),
    );
  }
}