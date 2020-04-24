import 'package:aminations/demo.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

final basicDemoRoutes = 
    Map.fromEntries(Demo.basicDemos().map((e) => MapEntry(e.route, e.builder)));

final miscDemoRoutes = 
    Map.fromEntries(Demo.miscDemo().map((e) => MapEntry(e.route, e.builder)));

final allRoutes = <String, WidgetBuilder>{
    ...basicDemoRoutes,
    ...miscDemoRoutes
};

class AnimationSamples extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Samples',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      routes: allRoutes,
      home: HomePage(),
    );
  }
  
}