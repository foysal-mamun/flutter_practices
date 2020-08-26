import 'package:flutter/cupertino.dart';
import 'package:provider_shopper_1/models/catalog.dart';
import 'package:provider_shopper_1/models/product.dart';

class CartModel extends ChangeNotifier {
  CatalogModel _catalog;

  final List<int> _productIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Product> get products =>
      _productIds.map((id) => _catalog.getById(id)).toList();

  void add(Product product) {
    _productIds.add(product.id);
    print(_productIds);
    notifyListeners();
  }

  void remove(Product product) {
    _productIds.remove(product.id);
    notifyListeners();
  }
}
