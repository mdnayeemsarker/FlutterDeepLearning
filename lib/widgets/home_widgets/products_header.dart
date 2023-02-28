import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
