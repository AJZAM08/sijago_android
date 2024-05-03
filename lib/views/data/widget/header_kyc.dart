import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';

class HeaderKyc extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const HeaderKyc({
    super.key,
    this.title = '', this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: myTextStyle(
              fontSize: 25,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          subtitle != null ?
          Text(
            textAlign: TextAlign.justify,
            subtitle!,
            style: myTextStyle(
              fontSize: 14,
              color: AppColors.black150,
              fontWeight: FontWeight.w500,
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}
