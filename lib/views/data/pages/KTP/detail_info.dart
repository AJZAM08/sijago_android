import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/data/controllers/data_controller.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/form_details.dart';
import '../../widget/header_kyc.dart';

class DetailsField extends StatelessWidget {
  const DetailsField({super.key});

  @override
  Widget build(BuildContext context) {
    var dataCtrl = Get.find<UserData>();
    return Scaffold(
      backgroundColor: AppColors.whiteBg,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
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
      body: Container(
        height: fullHeight,
        width: fullWidth,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 30, bottom: 20, left: 30),
                    child: HeaderKyc(
                      title: 'Lengkapi Identitaas Diri',
                      subtitle:
                          'Silahkan lengkapi data diri anda untuk melanjutkan ke step berikutnya',
                    ),
                  ),
                  FormDetails(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 20),
                    child: MyButton(
                      label: 'Selanjutnya',
                      onPressed: () {
                        dataCtrl.tambahData();
                        Get.toNamed(RouteName.selfieGuide);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
