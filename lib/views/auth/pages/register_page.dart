import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/size.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../data/routes/route_name.dart';
import '../widgets/footer_auth.dart';
import '../widgets/form_register.dart';
import '../widgets/header_auth.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBg,
        appBar: CustomAppBar(
          title: 'Daftar',
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
                child: HeaderAuth(
                  title: 'Ayo buat akun kamu',
                  subtitle:
                      'Lengkapi username, email, nomor HP, dan password untuk segera bergabung!',
                ),
              ),
              const FormRegister(),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => MyButton(
                  disabled: authC.isValid.value ? false : true,
                  label: 'Daftar',
                  onPressed: () {
                    if (authC.formKeyRegister.currentState!.validate()) {
                      authC.onClick.isFalse
                          ? authC.register()
                          : authC.onClick.value = true;
                    }
                  },
                  textGesture1: 'Sudah punya akun? ',
                  textGesture2: ' Masuk Sekarang',
                  onPressGesture: () {
                    Get.offNamed(RouteName.login);
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}
