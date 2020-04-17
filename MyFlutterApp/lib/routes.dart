import 'package:MyFlutterApp/screens/home.dart';
import 'package:flutter/material.dart';

import 'screens/item.dart';

class Routes {

  static RouteFactory routes() {
    
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;

      Widget screen;
      switch (settings.name) {
        case '/':
          screen = Home();
          break;
        case '/itemPage':
            screen = Item(arguments['id']);
          break;
        default:
          screen = null;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}