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
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                // itemCount: dummyList.length,
                itemCount: ProductsModel.items.length,
                itemBuilder: (context, index) {
                  final product = ProductsModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: GridTile(
                      header: Text(product.title),
                      child: Image.network(
                        product.thumbnail,
                        // height: 200,
                      ),
                      footer: Text(product.description),
                      // item: dummyList[index],
                    ),
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
