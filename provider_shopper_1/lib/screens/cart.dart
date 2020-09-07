import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper_1/models/cart.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(32),
              child: _CartList(),
            ))
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var cart = Provider.of<CartModel>(context);
    return ListView.builder(
      itemCount: cart.products.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(cart.products[index].name),
      ),
    );
  }
}
