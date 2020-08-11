import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ShoppingCart(),
    child: MyApp(),
  ));
}

class ShoppingCart extends ChangeNotifier {
  Set<Product> _shoppingCart = Set<Product>();

  void updateShoppingCart(Product product, bool inCart) {
    if (inCart) {
      _shoppingCart.remove(product);
    } else {
      _shoppingCart.add(product);
    }

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping Cart with Provider',
        home: ShoppingList(
          products: [
            Product(id: 1, name: 'product 1'),
            Product(id: 2, name: 'product 2')
          ],
        ));
  }
}

class ShoppingList extends StatelessWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ShoppingCart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView(
          children: products.map((Product product) {
        return ShoppingItem(
            product: product,
            inCart: cart._shoppingCart.contains(product) ? true : false);
      }).toList()),
    );
  }
}

class ShoppingItem extends StatelessWidget {
  ShoppingItem({this.product, this.inCart}) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getStyle() {
    if (!inCart) {
      return null;
    }

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        product.name,
        style: _getStyle(),
      ),
      leading: CircleAvatar(
        child: Text('${product.id}'),
        backgroundColor: _getColor(context),
      ),
      onTap: () => Provider.of<ShoppingCart>(context, listen: false)
          .updateShoppingCart(product, inCart),
    );
  }
}

class Product {
  Product({this.id, this.name});

  final int id;
  final String name;
}
