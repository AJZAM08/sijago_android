import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../data/widget/header_kyc.dart';
import '../../widget/pin_payment.dart';

class InputPIN extends StatelessWidget {
  const InputPIN({super.key});

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
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: HeaderKyc(title: 'Masukan PIN Transaksi', subtitle: 'Masukan 6 digit pin rahasia kamu',),
                    ),
                    SizedBox(height: 30,),
                    PINPayment(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
