import 'package:flutter/material.dart';
import 'package:flutter_dl/model/products_list.dart';

class ItemWidgets extends StatelessWidget {
  final Item item;

  const ItemWidgets({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.id} -> ${item.title}");
        },
        leading: Image.network(item.thumbnail),
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: Text("\$${item.price}"),
      ),
    );
  }
}
