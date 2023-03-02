import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dl/model/cart.dart';
import 'package:flutter_dl/widgets/home_widgets/product_details.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/product.dart';

class CratPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item product;
    return Scaffold(
      appBar: AppBar(
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p12().expand(),
          Divider(),
          _CartTotal().px12(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.cardColor).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet.".text.make()));
                  },
                  child: "Buy".text.xl.white.make())
              .w20(context)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetails(product: _cart.items[index]),
                    // ProductDetails(product: ProductsModel.getById(2)), //get Product by id
                  ),
                )
              },
              child: Card(
                child: ListTile(
                  leading:
                      Image.network(_cart.items[index].thumbnail).wh(40, 40),
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.cart_fill_badge_minus),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      setState(() {});
                    },
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _cart.items[index].title.text.make(),
                      _cart.items[index].description.text.make(),
                      "\$${_cart.items[index].price}".text.make(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
