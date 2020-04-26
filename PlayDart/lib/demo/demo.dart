import 'package:PlayDart/src/basic/01_basic_features.dart';
import 'package:flutter/material.dart';

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  Demo({ this.name, this.route, this.builder });

  static List<Demo> basicDemos() {
    return [
      Demo(
        name: BasicFeatures.demoName,
        route: BasicFeatures.routeName,
        builder: (context) => BasicFeatures(),
      )
    ];
  }

}