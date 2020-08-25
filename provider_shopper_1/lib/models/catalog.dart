import 'package:provider_shopper_1/models/product.dart';

class CatalogModel {
  static List<Product> products = [
    Product(name: 'Eggs'),
    Product(name: 'Flour'),
    Product(name: 'Chocolate chips')
  ];

  List getAll() {
    return products;
  }
}
