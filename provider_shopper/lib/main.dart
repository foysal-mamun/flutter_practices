import 'package:flutter/material.dart';
import 'package:provider_shopper/common/theme.dart';
import 'package:provider_shopper/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: appTheme,
      initialRoute: '/',
      routes: {'/': (context) => MyLogin()},
    );
  }
}
