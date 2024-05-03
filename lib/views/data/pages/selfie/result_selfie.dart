import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/controllers/system_controller.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/header_kyc.dart';

class ResultSelfie extends StatelessWidget {
  const ResultSelfie({super.key});

  @override
  Widget build(BuildContext context) {
    var cameraCtrl = Get.find<SystemController>();
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
        width: fullWidth,
        height: fullHeight,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: HeaderKyc(title: 'Upload Foto Selfie'),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Image.file(File(cameraCtrl.imagePathSelfie.value)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MyButton(
                label: 'Selanjutnya',
                onPressed: () {
                  Get.toNamed(RouteName.npwpCamera);
                },
                textGesture2: 'Foto Ulang',
                onPressGesture: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
