import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/custom_textfield.dart';
import '../../../../data/controllers/product_controller.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    var productCtrl = Get.find<ProductController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomTextField(
        controller: productCtrl.productController.value,
        onChanged:(value) => productCtrl.runFilter(value),
        label: 'Cari Produk',
        suffIcon: Icon(Icons.search),
        float: FloatingLabelBehavior.never,
      ),
    );
  }
}
