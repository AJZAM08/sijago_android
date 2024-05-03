import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/routes/route_name.dart';

class Notify_Warning extends StatelessWidget {
  const Notify_Warning({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Container(
        height: fullHeight - fullHeight * 94/100,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 10),
                child: Image.asset(Assets.image.warning),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                'Data diri belum dilengkapi',
                style: myTextStyle(
                  fontSize: 13,
                  color: AppColors.whiteBg,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RouteName.ktpGuide);
                  },
                  child: Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppColors.whiteBg,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Text(
                        'Lengkapi',
                        style: myTextStyle(
                          fontSize: 11,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
