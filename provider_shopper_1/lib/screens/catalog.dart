import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper_1/models/cart.dart';
import 'package:provider_shopper_1/models/catalog.dart';
import 'package:provider_shopper_1/models/product.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReuseableWidgets.getAppBar('My Catalog'),
      body: _MyList(),
    );
  }
}

class ReuseableWidgets {
  static getAppBar(String title) {
    return AppBar(
      title: Text(title),
      actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)],
    );
  }
}

class _MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = CatalogModel().getAll();

    return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: products.map((dynamic product) {
          return _MyListItem(
            product: product,
          );
        }).toList());
  }
}

class _MyListItem extends StatelessWidget {
  _MyListItem({this.product}) : super(key: ObjectKey(product));

  final Product product;

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return ListTile(
        onTap: cart.products.contains(product)
            ? () => cart.remove(product)
            : () => cart.add(product),
        leading: CircleAvatar(
          child: Text(product.name[0]),
        ),
        title: Text(product.name));
  }
}
