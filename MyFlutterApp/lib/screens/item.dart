import 'package:flutter/material.dart';

class Item extends StatelessWidget {

  final String _item;

  Item(this._item);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(this._item),
      ),
    );
  }

}