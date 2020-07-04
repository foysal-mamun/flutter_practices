import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flout'),
        Product(name: 'Chocolate chips')
      ]),
  ));
}

class ShoppingList extends StatelessWidget {
  ShoppingList({ Key key, this.products }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: products.map((Product product) {
          return ShoppingListItem(
            product: product,
          );
        }).toList(),
      ),
    );
  }
}

class Product {
  const Product({ this.name });

  final String name;
}

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({ this.product }) : super(key: ObjectKey(product));

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
    );
  }
}