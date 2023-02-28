import 'package:flutter/material.dart';
import 'package:flutter_dl/model/products_list.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Item product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${product.price}".text.bold.xl.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy Now".text.make(),
            )
          ],
        ).p32(),
        appBar: AppBar(),
        body: SafeArea(
            bottom: false,
            child: Column(children: [
              DetailsImage(product: product),
              // Co
              DetailsBody(product: product),
            ])));
  }
}

class DetailsImage extends StatelessWidget {
  final Item product;

  const DetailsImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Key(product.id.toString()),
      child: Image.network(product.thumbnail).fittedBox(fit: BoxFit.fill),
    ).h32(context);
  }
}

class DetailsBody extends StatelessWidget {
  final Item product;

  const DetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: VxArc(
      height: 20,
      arcType: VxArcType.CONVEY,
      edge: VxEdge.TOP,
      child: Container(
        color: Colors.white,
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            product.title.text.start.xl3.bold.make(),
            product.description.text.textStyle(context.captionStyle).make(),
            "***${product.rating}"
                .text
                .textStyle(context.headlineSmall)
                .red500
                .make(),
            "Category: ${product.category}"
                .text
                .textStyle(context.titleLarge)
                .pink400
                .capitalize
                .make(),
            "Discount: ${product.discountPercentage} %".text.red900.make(),
            "Stock: ${product.stock}".text.lg.make(),
            "Brand: ${product.brand}".text.capitalize.lg.make(),
          ],
        ).py64().px12(),
      ),
    ));
  }
}
