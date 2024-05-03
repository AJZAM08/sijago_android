import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../constant/textsytle.dart';

void snackBar(String label, String subtitle, Color color, String images) {
  Get.snackbar(
    margin: EdgeInsets.all(15),
    snackPosition: SnackPosition.TOP,
    label,
    subtitle,
    colorText: AppColors.whiteBg,
    backgroundColor: color,
    titleText: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        textAlign: TextAlign.start,
        label,
        style: myTextStyle(
          fontSize: 16,
          color: AppColors.whiteBg,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        textAlign: TextAlign.start,
        subtitle,
        style: myTextStyle(
          fontSize: 12,
          color: AppColors.whiteBg,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    icon: Padding(
      padding: const EdgeInsets.only(left: 15),
      child: SvgPicture.asset(
        images,
        width: 50,
      ),
    ),
  );
}
