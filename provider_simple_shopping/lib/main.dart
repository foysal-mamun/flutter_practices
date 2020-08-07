import 'package:flutter/material.dart';
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
      title: 'Simple Shopping List with Provider',
      home: ShoppingList(
        products: [
          Product(id: 1, name: 'Product 1'),
          Product(id: 2, name: 'Product 2'),
          Product(id: 3, name: 'Product 3'),
          Product(id: 4, name: 'Product 4')
        ],
      ),
    );
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
        title: Text('Shoping List'),
      ),
      body: ListView(
        children: products.map((Product product) {
          return ShoppingItem(
            product: product,
            inCart: cart._shoppingCart.contains(product) ? true : false,
          );
        }).toList(),
      ),
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

  TextStyle _getTextStyle() {
    if (!inCart) {
      return null;
    }

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${product.id}'),
        backgroundColor: _getColor(context),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(),
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
