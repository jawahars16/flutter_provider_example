import 'dart:math';

import 'package:flutter_provider_example/models/product.dart';

List<Product> generateData() {
  return List<Product>.generate(15, (index) {
    return Product(index, 'Robot ${index + 1}', 100 + Random().nextInt(150),
        'assets/${index + 1}.png');
  });
}
