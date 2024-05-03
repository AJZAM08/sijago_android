import 'package:flutter/material.dart';

import '../../../core/constant/size.dart';
import '../widget/product_widget/hyperlink_reksadana.dart';
import '../widget/product_widget/product_grid.dart';
import '../widget/product_widget/search_box.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fullHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          SearchBox(),
          ReksaDanaBox(),
          GridProduct(),
        ],
      ),
    );
  }
}
