import 'package:aminations/src/basics/01_animated_container.dart';
import 'package:aminations/src/basics/02_page_route_builder.dart';
import 'package:aminations/src/basics/03_animation_controller.dart';
import 'package:aminations/src/basics/04_tweens.dart';
import 'package:aminations/src/basics/05_animated_builder.dart';
import 'package:aminations/src/basics/06_custom_tween.dart';
import 'package:aminations/src/basics/07_tween_sequence.dart';
import 'package:aminations/src/basics/08_fade_transition.dart';
import 'package:aminations/src/basics/09_animated_positioned.dart';
import 'package:aminations/src/basics/10_animated_switcher.dart';
import 'package:aminations/src/misc/animated_list.dart';
import 'package:aminations/src/misc/card_swipe.dart';
import 'package:aminations/src/misc/carousel.dart';
import 'package:aminations/src/misc/curved_animation.dart';
import 'package:aminations/src/misc/expand_card.dart';
import 'package:aminations/src/misc/focus_image.dart';
import 'package:aminations/src/misc/hero_animation.dart';
import 'package:aminations/src/misc/physics_card_drag.dart';
import 'package:aminations/src/misc/repeating_animation.dart';
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
      ),
      Demo(
        name: CustomTweenDemo.demoName,
        route: CustomTweenDemo.routeName,
        builder: (context) => CustomTweenDemo(),
      ),
      Demo(
        name: TweenSequenceDemo.demoName,
        route: TweenSequenceDemo.routeName,
        builder: (context) => TweenSequenceDemo() 
      ),
      Demo(
        name: FadeTransitionDemo.demoName,
        route: FadeTransitionDemo.routeName,
        builder: (context) => FadeTransitionDemo(),
      ),
      Demo(
        name: AnimatedPositionedDemo.demoName,
        route: AnimatedPositionedDemo.routeName,
        builder: (context) => AnimatedPositionedDemo()
      ),
      Demo(
        name: AnimatedSwitcherDemo.demoName,
        route: AnimatedSwitcherDemo.routeName,
        builder: (context) => AnimatedSwitcherDemo(),
      )
    ];
  }

  static List<Demo> miscDemo() {

    return [
      Demo(
        name: ExpandCardDemo.demoName,
        route: ExpandCardDemo.routeName,
        builder: (context) => ExpandCardDemo(), 
      ),
      Demo(
        name: CarouselDemo.demoName,
        route: CarouselDemo.routeName,
        builder: (context) => CarouselDemo(),
      ),
      Demo(
        name: FocusImageDemo.demoName,
        route: FocusImageDemo.routeName,
        builder: (context) => FocusImageDemo(),
      ),
      Demo(
        name: HeroAnimationDemo.demoName,
        route: HeroAnimationDemo.routeName,
        builder: (context) => HeroAnimationDemo(),
      ),
      Demo(
        name: CardSwipeDemo.demoName,
        route: CardSwipeDemo.routeName,
        builder: (context) => CardSwipeDemo(),
      ),
      Demo(
        name: AnimatedListDemo.demoName,
        route: AnimatedListDemo.routeName,
        builder: (context) => AnimatedListDemo(),
      ),
      Demo(
        name: RepeatingAnimationDemo.demoName,
        route: RepeatingAnimationDemo.routeName,
        builder: (context) => RepeatingAnimationDemo(),
      ),
      Demo(
        name: CurvedAnimationDemo.demoName,
        route: CurvedAnimationDemo.routeName,
        builder: (context) => CurvedAnimationDemo(),
      ),
      Demo(
        name: PhysicsCardDragDemo.demoName,
        route: PhysicsCardDragDemo.routeName,
        builder: (context) => PhysicsCardDragDemo(),
      )
    ];

  }
  
}