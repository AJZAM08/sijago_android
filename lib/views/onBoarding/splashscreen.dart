import 'package:flutter/material.dart';

import '../../core/assets/assets_gen.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/size.dart';
import '../../core/constant/textsytle.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: fullWidth,
        color: AppColors.whiteBg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: AppColors.whiteBg,
                width: fullWidth,
                child: Center(
                  child: Image.asset(
                    Assets.logo.logoSijago,
                    width: 250,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: fullWidth,
              height: 100,
              child: Center(
                child: Text(
                  'V 1.0',
                  style: myTextStyle(
                    color: AppColors.black150,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
