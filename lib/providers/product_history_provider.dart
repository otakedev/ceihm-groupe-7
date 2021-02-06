import 'package:alergo/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductHistoryProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  add(ProductModel product) {
    _products.remove(product);
    _products.add(product);
  }

  List<ProductModel> retrieveLast(int count) {
    if (count >= _products.length) {
      return _products.reversed.toList();
    }
    return _products.sublist(0, count).reversed.toList();
  }

  clear() {
    _products.clear();
  }
}
