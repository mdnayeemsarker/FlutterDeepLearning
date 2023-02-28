import 'package:flutter/material.dart';
import 'package:flutter_dl/widgets/home_widgets/product_details.dart';
import 'package:flutter_dl/widgets/home_widgets/product_image.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_dl/model/products_list.dart';
import 'package:flutter_dl/pages/home_page.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductsModel.items.length,
      itemBuilder: (context, index) {
        final product = ProductsModel.items[index];
        return InkWell(
            onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(product: product),
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
            // Row(
            //   children: [
            //     "***${product.rating}".text.make(),
            //     product.discountPercentage.text.make(),
            //   ],
            // ),
            2.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${product.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy Now".text.make(),
                )
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}
