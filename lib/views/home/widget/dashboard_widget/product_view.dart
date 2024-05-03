import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sijago_android/core/constant/colors.dart';
import 'package:sijago_android/data/controllers/product_controller.dart';

import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import 'product_list.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        height: fullHeight * .39,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(124, 242, 242, 242)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Produk List',
              style: myTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => Expanded(
              child: controller.allProduct.isNotEmpty &&
                      controller.isFetch.value == true
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.allProduct.length - 5,
                      itemBuilder: ((context, index) {
                        print(controller.isFetch.value);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ProductList(
                            merk: controller.allProduct[index].name,
                            risk: 'Risiko Rendah',
                            harga:
                                '${controller.allProduct[index].productData![index].harga}/unit',
                            icon: controller.allProduct[index]
                                        .productData![index].perubahanHarian >
                                    -0.1
                                ? Icons.trending_up
                                : Icons.trending_down,
                            percent: controller.allProduct[index]
                                        .productData![index].perubahanHarian >
                                    -0.1
                                ? '+ ${controller.allProduct[index].productData![index].perubahanHarian}%'
                                : '- ${controller.allProduct[index].productData![index].perubahanHarian}%',
                            iconColor: controller.allProduct[index]
                                        .productData![index].perubahanHarian <
                                    -0.1
                                ? AppColors.red
                                : AppColors.green,
                            textColor: controller.allProduct[index]
                                        .productData![index].perubahanHarian <
                                    -0.1
                                ? AppColors.red
                                : AppColors.green,
                          ),
                        );
                      }),
                    )
                  : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: fullHeight - fullHeight * 0.6,
                      color: Colors.white,
                    ),
                  ),
            ),)
          ],
        ),
      ),
    );
  }
}
