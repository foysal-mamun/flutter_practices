import 'package:PlayDart/demo/demo.dart';
import 'package:PlayDart/pages/home_page.dart';
import 'package:flutter/material.dart';

final basicDemoRoutes = 
  Map.fromEntries(Demo.basicDemos().map((e) => MapEntry(e.route, e.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes
};

class TourOfDartLang extends StatelessWidget {

  static const String title = 'A tour of the Dart language';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TourOfDartLang.title,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange 
      ),
      home: HomePage(),
      routes: allRoutes,
    );
  }
}