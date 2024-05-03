import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/size.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/page_controller.dart';
import '../../../data/controllers/product_controller.dart';
import '../../../data/models/product_model.dart';
import '../widget/product_widget/button_details.dart';
import '../widget/product_widget/chart_product.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final pageControllerX = Get.find<PageControllerX>();
    final PageController pageController = PageController();
    var productCtrl = Get.find<ProductController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBg,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: AppColors.primary,
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  child: Image.asset(
                    Assets.logo.logoSijago,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: fullHeight + fullHeight * .3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              overflow: TextOverflow.ellipsis,
                              product.name,
                              style: myTextStyle(
                                  fontSize: product.name.length < 18 ? 25 : 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black150),
                            ),
                            AutoSizeText(
                              product.description,
                              style: myTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black150),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Container(
                    height: fullHeight - fullHeight * 96 / 100,
                    child: Row(
                      children: [
                        ButtonDetail(
                            pageIndex: 0,
                            title: 'Informasi',
                            pageController: pageController),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonDetail(
                            pageIndex: 1,
                            title: 'Simulasi Investasi',
                            pageController: pageController),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (index) {
                        pageControllerX.changePage(index);
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ChartProduct(
                              index: productCtrl.selectedIndex.value),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Image.asset(Assets.image.ups),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Ups, Fitur ini belum tersedia',
                                    style: myTextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.red,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
