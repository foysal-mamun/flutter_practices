import 'package:provider_shopper_1/models/product.dart';

class CatalogModel {
  static List<Product> products = [
    Product(id: 1, name: 'Eggs'),
    Product(id: 2, name: 'Flour'),
    Product(id: 3, name: 'Chocolate chips')
  ];

  List getAll() {
    return products;
  }

  Product getById(int id) => products.firstWhere((p) => p.id == id);
}
