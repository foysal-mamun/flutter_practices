import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(),
  ));
}

class ShoppingList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('1'),
            ),
            title: Text('Product 1'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black54,
              child: Text('2'),
            ),
            title: Text(
              'Product 1', 
              style: TextStyle( 
                color: Colors.black54, 
                decoration: TextDecoration.lineThrough,
              )
            )
          )
        ],
      ),
    );
  }
}