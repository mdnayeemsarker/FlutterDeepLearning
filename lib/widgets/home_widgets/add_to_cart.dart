import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dl/model/cart.dart';
import 'package:flutter_dl/model/product.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item product;

  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.product);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _product = ProductsModel();
          _cart.product = _product;
          _cart.add(widget.product);
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: "This item already added".text.make()));
        }
      },
      child: isInCart
          ? Icon(Icons.done)
          : Icon(CupertinoIcons.cart_fill_badge_plus),
    );
  }
}
