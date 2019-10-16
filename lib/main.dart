import 'package:flutter/material.dart';
import 'package:flutter_provider_example/screens/cart/cart.dart';
import 'package:flutter_provider_example/models/cart.dart' as models;
import 'package:provider/provider.dart';
import 'screens/products/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var cart = Cart();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => models.Cart(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Products(),
      ),
    );
  }
}
