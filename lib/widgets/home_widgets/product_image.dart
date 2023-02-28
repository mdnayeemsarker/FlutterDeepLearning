import 'package:flutter/material.dart';
import 'package:flutter_dl/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
