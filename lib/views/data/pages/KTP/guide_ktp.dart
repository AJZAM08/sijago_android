import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/header_kyc.dart';
import '../../widget/keterangan_ktp.dart';

class GuideKTP extends StatelessWidget {
  const GuideKTP({super.key});

  @override
  Widget build(BuildContext context) {
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
                    child: HeaderKyc(title: 'Panduan Upload KTP'),
                  ),
                  Image.asset(
                    Assets.image.ktp,
                    height: fullHeight * .46,
                    width: fullWidth * .8,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: KeteranganKTP(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyButton(
                    label: 'Upload Foto KTP',
                    onPressed: () {
                      Get.toNamed(RouteName.ktpCamera);
                    },
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
