import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/constant/colors.dart';
import 'package:sijago_android/core/constant/size.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_button.dart';
import '../../../data/routes/route_name.dart';
import '../widgets/header_auth.dart';

class VerifyDone extends StatelessWidget {
  const VerifyDone({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBg,
        appBar: CustomAppBar(
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
        body: SizedBox(
          height: fullHeight,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: HeaderAuth(
                        title: 'Yey!, Akun anda telah terverifikasi',
                        subtitle:
                            'Lengkapi Informasi identitas anda dan atur pin transaksi untuk memulai investasi anda sekarang  juga mulai dari Rp. 50.000 saja',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 30, right: 30),
                      child: Image.asset(Assets.image.verify),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: MyButton(
                  label: 'Lengkapi Data Diri',
                  onPressed: () {
                    Get.toNamed(RouteName.ktpGuide);
                  },
                  textGesture1: '',
                  textGesture2: 'Lain Kali',
                  onPressGesture: () {
                    Get.toNamed(RouteName.dashboard);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
