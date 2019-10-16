import 'package:flutter/foundation.dart';
import 'package:flutter_provider_example/models/product.dart';

class Cart extends ChangeNotifier {
  List<Product> products = [];

  void add(Product product) {
    products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    products.remove(product);
    notifyListeners();
  }

  void clear() {
    products.clear();
    notifyListeners();
  }

  bool get isEmpty => products.isEmpty;

  int get total => products.map((p) => p.price).reduce((p1, p2) => p1 + p2);
}
