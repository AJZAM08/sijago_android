import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/constant/textsytle.dart';

import '../../core/assets/assets_gen.dart';
import '../../core/components/custom_appbar.dart';
import '../../core/constant/colors.dart';

class OnWorkingPage extends StatelessWidget {
  const OnWorkingPage({super.key});

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
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 113, 205),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              Assets.logo.logoSijago,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.image.ups),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Ups, Fitur ini belum tersedia',
                  style: myTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
