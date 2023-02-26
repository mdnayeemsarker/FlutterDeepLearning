import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dl/model/products_list.dart';
import 'package:flutter_dl/widgets/deawer.dart';
import 'package:flutter_dl/widgets/item_widgets.dart';

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
      appBar: AppBar(
        title: Text("App Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (ProductsModel.items.isNotEmpty)
            ? ListView.builder(
                // itemCount: dummyList.length,
                itemCount: ProductsModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidgets(
                    // item: dummyList[index],
                    item: ProductsModel.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              )),
      ),
      drawer: MyDrawer(),
    );
  }
}
