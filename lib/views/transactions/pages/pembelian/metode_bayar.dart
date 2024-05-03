import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/data/routes/route_name.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/widget_controller.dart';
import '../../widget/payment_box.dart';

class MetodeBayar extends StatelessWidget {
  const MetodeBayar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<WidgetController>();
    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      appBar: CustomAppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                controller.activeIndex.value = null;
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
            ),
            Text(
              'Metode Pembayaran',
              style: myTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black.withOpacity(.8),
              ),
            ),
          ],
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
      body: Container(
        height: fullHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  PaymentBox(
                    index: 0,
                    image: Assets.image.linkAja,
                    metode: 'LinkAja',
                  ),
                  PaymentBox(
                    index: 1,
                    image: Assets.image.bankBNI,
                    metode: 'Bank BNI',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Pembayaran',
                    style: myTextStyle(
                      color: AppColors.black.withOpacity(.7),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Rp. ${controller.nominal.value}',
                    style: myTextStyle(
                      color: AppColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            MyButton(label: 'Bayar Sekarang', onPressed: () {
              Get.toNamed(RouteName.pinInput);
            })
          ],
        ),
      ),
    );
  }
}
