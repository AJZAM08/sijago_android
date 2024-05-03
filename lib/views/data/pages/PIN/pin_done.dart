import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/header_kyc.dart';

class PINDone extends StatelessWidget {
  const PINDone({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30),
                        child: HeaderKyc(
                            title: 'Ssstt!, PIN anda Berhasil disimpan',
                            subtitle:
                                'Hindari memberitahu PIN rahasiamu ke orang lain untuk mencegah penyalahgunaan akunmu'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                        child: Image.asset(Assets.image.kyc),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: MyButton(
                    label: 'Mulai Investasi',
                    onPressed: () {
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
