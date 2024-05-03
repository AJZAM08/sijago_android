import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/data/routes/route_name.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';

class RiskBanner extends StatelessWidget {
  const RiskBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        height: fullHeight - fullHeight * 90/100,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15,left: 15),
                child: Image.asset(
                  Assets.image.risk,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profil Resiko',
                        style: myTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Cari tahu portofolio yang sesuai dengan tingkat risiko investasi kamu',
                        style: myTextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(.5)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(RouteName.riskProfile);
                              },
                              child: Container(
                                width: 60,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteBg,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Center(
                                  child: Text(
                                    'Mulai',
                                    style: myTextStyle(
                                      fontSize: 11,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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
