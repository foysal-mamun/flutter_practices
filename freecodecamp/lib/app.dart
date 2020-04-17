import 'package:flutter/material.dart';
import 'package:freecodecamp/screens/locations/locations.dart';
import 'package:freecodecamp/screens/location_detail/location_detail.dart';
import 'style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/locatoin_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetial(arguments['id']);
          break;
        default:
          return null;
      }

      return MaterialPageRoute(builder: (BuildContext context) => screen );
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme( headline6: AppBarTextStyle)
      ),
      textTheme: TextTheme(
        headline6: TitleTextStyle,
        bodyText1: Body1TextStyle
      )
    );
  }
}