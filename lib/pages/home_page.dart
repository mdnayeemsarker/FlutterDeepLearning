import 'package:flutter/material.dart';
import 'package:flutter_dl/model/products_list.dart';
import 'package:flutter_dl/widgets/deawer.dart';
import 'package:flutter_dl/widgets/item_widgets.dart';

class HomePage extends StatelessWidget {
  String name = "MD. NAYEEM SARKER";
  int age = 24;
  int mobile = 01714466703;
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => ProductsModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          // itemCount: ProductsModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidgets(
              item: dummyList[index],
              // item: ProductsModel.items[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
