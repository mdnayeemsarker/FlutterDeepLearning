import 'package:flutter/material.dart';
import 'package:flutter_dl/model/cart.dart';
import 'package:flutter_dl/utils/routes.dart';
import 'package:flutter_dl/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_dl/model/product.dart';
import 'package:flutter_dl/widgets/home_widgets/product_details.dart';
import 'package:flutter_dl/widgets/home_widgets/product_image.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductsModel.items.length,
      itemBuilder: (context, index) {
        // final product = ProductsModel.getByPosition(index);
        final product = ProductsModel.items[index];
        return InkWell(
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(product: product),
                      // ProductDetails(product: ProductsModel.getById(2)), //get Product by id
                    ),
                  )
                },
            child: ProductItem(product: product));
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Item product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(product.id.toString()),
            child: ProductImage(thumbnail: product.thumbnail)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.title.text.lg.bold.make(),
            product.description.text.textStyle(context.captionStyle).make(),
            2.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "***${product.rating}".text.make(),
                product.discountPercentage.text.make(),
              ],
            ),
            2.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${product.price}".text.bold.xl.make(),
                AddToCart(product: product),
                _BuyNow(product: product)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(150).make().px(5).py(5);
  }
}

class _BuyNow extends StatefulWidget {
  const _BuyNow({
    super.key,
    required this.product,
  });

  final Item product;

  @override
  State<_BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<_BuyNow> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final _product = ProductsModel();
        final _cart = CartModel();
        _cart.product = _product;
        _cart.add(widget.product);
        Navigator.pushNamed(context, MyRoutes.cartRoute);
      },
      child: "Buy Now".text.make(),
    );
  }
}
