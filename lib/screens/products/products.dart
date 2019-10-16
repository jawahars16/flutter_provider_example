import 'package:flutter/material.dart';
import 'package:flutter_provider_example/components/cart_button.dart';
import 'package:flutter_provider_example/models/cart.dart';
import 'package:flutter_provider_example/services/data_service.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    var products = generateData();

    return Scaffold(
      appBar: AppBar(
          title: Row(children: <Widget>[
        Text('Robot Shop'),
        CartButton(),
      ], mainAxisAlignment: MainAxisAlignment.spaceBetween)),
      body: GridView.count(
          crossAxisCount: 2,
          children: products.map((product) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    product.image,
                    width: 100,
                    height: 100,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text('\$ ${product.price.toString()}'),
                  Consumer<Cart>(builder: (ctx, cart, child) {
                    if (cart.products.contains(product)) {
                      return FlatButton(
                        child: Text('Remove from cart'),
                        onPressed: () {
                          cart.remove(product);
                        },
                      );
                    } else {
                      return FlatButton(
                        child: Text('Add to cart'),
                        onPressed: () {
                          cart.add(product);
                        },
                      );
                    }
                  })
                ],
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.all(5),
              color: Colors.white,
            );
          }).toList()),
    );
  }
}
