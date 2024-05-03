import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/product_controller.dart';

class HeaderProduk extends StatelessWidget {
  const HeaderProduk({super.key});

  @override
  Widget build(BuildContext context) {
    var productCtrl = Get.find<ProductController>();
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productCtrl.allProduct[productCtrl.selectedIndex.value].name,
                  style: myTextStyle(
                    fontSize: productCtrl.allProduct[productCtrl.selectedIndex.value].name.length < 18 ? 25 : 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  textAlign: TextAlign.start,
                  productCtrl.allProduct[productCtrl.selectedIndex.value].description,
                  style: myTextStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
