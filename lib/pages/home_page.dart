import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_dl/model/product.dart';
import 'package:flutter_dl/utils/routes.dart';
import 'package:flutter_dl/widgets/home_widgets/products_list.dart';

import '../widgets/home_widgets/products_header.dart';

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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(CupertinoIcons.cart)),
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
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            )),
      ),
    );
  }
}
