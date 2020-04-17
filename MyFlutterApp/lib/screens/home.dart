import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final List<String> items = ['item1', 'item2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: items.map((e) => GestureDetector(
          child: Text(e),
          onTap: () => _onItemTap(context, e),
        )).toList(),
      ),
    );
  }
}

_onItemTap(BuildContext context, String item) {
  Navigator.pushNamed(context, '/itemPage', arguments: {"id": item});
}