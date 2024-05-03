import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/core/constant/size.dart';
import 'package:sijago_android/views/auth/widgets/form_verify.dart';
import 'package:sijago_android/views/auth/widgets/header_auth.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../data/routes/route_name.dart';

class VerificationPage extends StatelessWidget {
  final String label;
  const VerificationPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBg,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () => Get.offNamed(RouteName.register),
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
                      child: HeaderAuth(
                        title: 'Verifikasi Akun',
                        subtitle: label == 'phone'
                            ? 'Masukkan 6 digit kode aktivasi yang dikirimkan melalui Whatsapp anda'
                            : 'Verifikasi akun anda dengan pesan yang dikirim ke Email anda',
                      ),
                    ),
                    label == 'phone' ? VerifyForm() : SizedBox(),
                    Center(
                      child: InkWell(
                        onTap: () {
                          authController.reloadUser();
                        },
                        child: label == 'phone'
                            ? Text(
                                'Kirim ulang kode',
                                style: myTextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary),
                              )
                            : Text(
                                'Refresh',
                                style: myTextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Obx(
                  () => MyButton(
                    disabled:
                        authController.verificationDone.isFalse ? true : false,
                    label: 'Verifikasi',
                    onPressed: label == 'phone'
                        ? () {
                            Get.offNamed(RouteName.verifyDone);
                          }
                        : () {
                            Get.offNamed(RouteName.verifyDone);
                          },
                    // textGesture1: '',
                    // textGesture2: label == 'phone'
                    //     ? 'Verifikasi melalui Email'
                    //     : 'Verifikasi melalui nomor Handphone',
                    // onPressGesture: () {
                    //   Get.back();
                    // },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
