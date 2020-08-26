import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper_1/models/cart.dart';
import 'package:provider_shopper_1/models/catalog.dart';
import 'package:provider_shopper_1/screens/catalog.dart';

import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => CatalogModel(),
          ),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              cart.catalog = catalog;
              return cart;
            },
          )
        ],
        child: MaterialApp(
          title: 'Provider Practice',
          routes: {
            '/': (context) => MyLogin(),
            '/catalog': (context) => MyCatalog()
          },
        ));
  }
}
