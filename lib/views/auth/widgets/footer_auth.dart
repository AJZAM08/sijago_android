import 'package:flutter/material.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              'Terdaftar dan Diawasi oleh',
              style: myTextStyle(
                color: AppColors.grey.withOpacity(.5),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.footer.footerIso),
                Image.asset(Assets.footer.footerOjk),
              ],
            ),
          ],
        ),
      ),
    );
  }
}