import 'package:flutter/material.dart';
import 'package:provider_shopper_1/screens/catalog.dart';

import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Practice',
      routes: {
        '/': (context) => MyLogin(),
        '/catalog': (context) => MyCatalog()
      },
    );
  }
}
