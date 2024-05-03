import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sijago_android/core/components/custom_button.dart';
// import 'package:sijago_android/views/other/ubah_profile.dart';
// import 'package:sijago_android/views/data/pages/bank/bank_pencairan.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/auth_controller.dart';
import '../../../data/controllers/data_controller.dart';
import '../../../data/routes/route_name.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<AuthController>();
    var dataCtrl = Get.find<UserData>();
    var userData = dataCtrl.userData.value!;
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(Assets.avatar.avatar_3)),
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                userData['username'] ?? 'Unknown',
                textAlign: TextAlign.center,
                style: myTextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.black.withOpacity(.15),
                    ),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.onWorking);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 189, 247, 255),
                            child: Icon(
                              LineIcons.user,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Informasi akun',
                                style: myTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.onWorking);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 189, 247, 255),
                            child: Icon(
                              LineIcons.wallet,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Rekening Bank',
                                style: myTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.onWorking);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 189, 247, 255),
                            child: Icon(
                              LineIcons.question,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Bantuan',
                                style: myTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.onWorking);
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 189, 247, 255),
                            child: Icon(
                              LineIcons.clipboard,
                              color: AppColors.primary,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Syarat dan Ketentuan',
                                style: myTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: MyButton(
                  color: AppColors.red,
                  label: 'Logout',
                  onPressed: () {
                    ctrl.logout();
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
