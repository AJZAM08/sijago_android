import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/size.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/widget_controller.dart';

class PaymentBox extends StatelessWidget {
  final String image;
  final String metode;
  final int index;
  const PaymentBox(
      {super.key, required this.image, required this.metode, required this.index});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<WidgetController>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: InkWell(
        onTap: () {
          controller.setActiveIndex(index);
        },
        child: Obx(
          () => Container(
            height: fullHeight * .07,
            decoration: BoxDecoration(
              color: AppColors.whiteBg,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(.1),
                  offset: Offset(1, 2),
                  blurRadius: 2,
                ),
              ],
              border: controller.activeIndex.value == index
                  ? Border.all(color: Colors.blue, width: 2)
                  : Border.all(color: Colors.transparent),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(image),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          metode,
                          style: myTextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Biaya Pembayaran',
                              style: myTextStyle(
                                color: AppColors.black.withOpacity(.7),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Gratis',
                              style: myTextStyle(
                                color: const Color.fromARGB(255, 2, 179, 255),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
