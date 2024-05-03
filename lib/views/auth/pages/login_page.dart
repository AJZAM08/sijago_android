import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/data/controllers/data_controller.dart';
import 'package:sijago_android/data/controllers/transaction_controller.dart';
import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/size.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../data/routes/route_name.dart';
import '../widgets/footer_auth.dart';
import '../widgets/form_login.dart';
import '../widgets/header_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    final dataC = Get.find<UserData>();
    final transC = Get.find<TransactionsController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBg,
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
                child: HeaderAuth(
                  title: 'Selamat Datang Kembali!',
                  subtitle:
                      'Yuk rencanakan masa depanmu, dengan memulai investasi reksa dana!',
                ),
              ),
              const FormLogin(),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => MyButton(
                  label: 'Masuk',
                  disabled: authC.isValid.value ? false : true,
                  onPressed: () {
                    if (authC.formKeyLogin.currentState!.validate()) {
                      authC.onClick.isFalse
                          ? authC.login()
                          : authC.onClick.value = true;
                      dataC.fetchUserData(authC.emailController.value.text);
                      transC.fetchPembelianData(authC.emailController.value.text);
                    }
                  },
                  textGesture1: 'Belum punya akun? ',
                  textGesture2: ' Daftar Sekarang',
                  onPressGesture: () {
                    Get.offNamed(RouteName.register);
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
