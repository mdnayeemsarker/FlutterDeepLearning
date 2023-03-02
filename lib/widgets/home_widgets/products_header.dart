import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_dl/widgets/themes.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Simple Shopping App".text.bold.white.xl2.make(),
        "Trending Products".text.xl.white.make(),
      ],
    );
  }
}
