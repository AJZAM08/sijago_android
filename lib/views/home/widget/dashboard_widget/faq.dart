import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';

class FAQBar extends StatelessWidget {
  const FAQBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: fullHeight * .06,
        decoration: BoxDecoration(
          color: Color.fromARGB(124, 242, 242, 242),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FAQ',
              style: myTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded
            )
          ],
        ),
      ),
    );
  }
}
