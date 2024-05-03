import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/form_pin.dart';
import '../../widget/header_kyc.dart';

class VerifyPIN extends StatelessWidget {
  const VerifyPIN({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SizedBox(
          height: fullHeight,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: HeaderKyc(
                          title: 'Konfirmasi PIN',
                          subtitle:
                              'Masukkan 6 digit PIN rahasiamu. PIN akan digunakan dalam proses transaksi didalam aplikasi'),
                    ),
                    const PINForm(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: MyButton(
                  label: 'Selanjutnya',
                  onPressed: () {
                    Get.offNamed(RouteName.pinDone);
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
