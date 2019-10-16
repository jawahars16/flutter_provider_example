import 'package:flutter/material.dart';
import 'package:flutter_provider_example/screens/cart/cart.dart';
import 'package:flutter_provider_example/models/cart.dart' as models;
import 'package:provider/provider.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        label: Consumer<models.Cart>(
          builder: (ctc, cart, widget) {
            return Text(cart.products.length.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18));
          },
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => Cart()));
        });
  }
}
