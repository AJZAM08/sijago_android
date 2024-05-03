import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/product_controller.dart';
import '../../pages/product_details.dart';

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var productCtrl = Get.find<ProductController>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: productCtrl.allProduct.length,
            itemBuilder: (context, index) {
              var product = productCtrl.allProduct[index];
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Get.to(() => ProductDetails(product: product));
                  productCtrl.changeIndex(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteBg,
                      border: Border.all(
                        width: 1,
                        color: Colors.black.withOpacity(.1),
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          height: 10,
                        ),
                        AutoSizeText(
                          textAlign: TextAlign.center,
                          product.name,
                          style: myTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          textAlign: TextAlign.center,
                          product.description,
                          style: myTextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black150,
                          ),
                          maxFontSize: 10,
                          minFontSize: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
