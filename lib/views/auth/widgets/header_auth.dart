import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';

class HeaderAuth extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderAuth({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: myTextStyle(
                fontSize: 25,
                color: AppColors.primary,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: myTextStyle(
              fontSize: 14,
              color: AppColors.black150,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
