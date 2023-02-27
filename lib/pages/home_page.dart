import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dl/model/products_list.dart';
import 'package:flutter_dl/widgets/deawer.dart';
import 'package:flutter_dl/widgets/item_widgets.dart';
import 'package:flutter_dl/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "MD. NAYEEM SARKER";

  int age = 24;

  int mobile = 01714466703;

  @override
  void initState() {
    super.initState();
    lodeData();
  }

  lodeData() async {
    final productsJson =
        await rootBundle.loadString("assets/files/products.json");
    final decodedData = jsonDecode(productsJson);
    var productsListData = decodedData["products"];
    ProductsModel.items = List.from(productsListData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(5, (index) => ProductsModel.items[0]);
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductHeader(),
                if (ProductsModel.items.isNotEmpty)
                  ProductList().expand()
                else
                  Center(child: CircularProgressIndicator())
              ],
            )),
      ),
    );
  }
}

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Simple Shopping App".text.bold.xl2.make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ProductsModel.items.length,
      itemBuilder: (context, index) {
        final product = ProductsModel.items[index];
        return ProductItem(product: product);
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
        ProductImage(thumbnail: product.thumbnail),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.title.text.lg.bold.make(),
            product.description.text.textStyle(context.captionStyle).make(),
            15.heightBox,
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

class ProductImage extends StatelessWidget {
  final thumbnail;

  const ProductImage({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      thumbnail,
    ).box.rounded.p16.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
