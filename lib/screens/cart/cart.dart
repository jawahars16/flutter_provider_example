import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_example/models/cart.dart' as models;

class Cart extends StatelessWidget {
  Widget _buildProductItem(Product product) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Row(
        children: <Widget>[
          Image.asset(
            product.image,
            width: 40,
            height: 40,
          ),
          Expanded(
            child: Container(
              child: Text(product.name),
              padding: EdgeInsets.all(10),
            ),
          ),
          Text("\$${product.price.toString()}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
              children: <Widget>[Text('Cart')],
              mainAxisAlignment: MainAxisAlignment.spaceBetween)),
      body: Container(child: Consumer<models.Cart>(
        builder: (context, cart, child) {
          if (cart.isEmpty) {
            return Center(
              child: Text('cart is empty'),
            );
          }
          return Column(children: <Widget>[
            Container(
              child: Text(
                'Items in cart',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              margin: EdgeInsets.all(10),
            ),
            Container(
                height: cart.products.length * 50.0 + 30,
                child: ListView(
                    children: cart.products.map(_buildProductItem).toList())),
            Container(
                margin: EdgeInsets.all(30),
                child: RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Total: \$ ${cart.total}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Checkout',
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                ))
          ]);
        },
      )),
    );
  }
}
