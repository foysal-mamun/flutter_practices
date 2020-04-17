import 'package:aminations/src/basics/01_animated_container.dart';
import 'package:aminations/src/basics/02_page_route_builder.dart';
import 'package:aminations/src/basics/03_animation_controller.dart';
import 'package:aminations/src/basics/04_tweens.dart';
import 'package:aminations/src/basics/05_animated_builder.dart';
import 'package:flutter/material.dart';

class Demo {

  final String name;
  final String route;
  final WidgetBuilder builder;

  Demo({this.name, this.route, this.builder});


  static List<Demo> basicDemos() {
    return [
      Demo(
        name: AnimatedContainerDemo.demoName,
        route: AnimatedContainerDemo.routeName,
        builder: (context) => AnimatedContainerDemo()
      ),
      Demo(
        name: PageRouteBuilderDemo.demoName,
        route: PageRouteBuilderDemo.routeName,
        builder: (contex) => PageRouteBuilderDemo()
      ),
      Demo(
        name: AnimationControllerDemo.demoName,
        route: AnimationControllerDemo.routeName,
        builder: (context) => AnimationControllerDemo()
      ),
      Demo(
        name: TweenDemo.demoName,
        route: TweenDemo.routeName,
        builder: (context) => TweenDemo(),
      ),
      Demo(
        name: AnimatedBuilderDemo.demoName,
        route: AnimatedBuilderDemo.routeName,
        builder: (context) => AnimatedBuilderDemo(),
      )
    ];
  }
  
}