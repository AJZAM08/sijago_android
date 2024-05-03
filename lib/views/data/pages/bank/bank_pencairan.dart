import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/form_bank.dart';
import '../../widget/header_kyc.dart';

class BankPencairan extends StatelessWidget {
  const BankPencairan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Masuk',
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
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: HeaderKyc(
                  title: 'Informasi Bank Pencairan',
                  subtitle: 'Kemana kami menstranfer uang anda',
                ),
              ),
              FormBank(),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                label: 'Selanjutnya',
                onPressed: () {
                  Get.offNamed(RouteName.kycDone);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
