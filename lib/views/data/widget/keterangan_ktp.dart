import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';

class KeteranganKTP extends StatelessWidget {
  const KeteranganKTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pastikan foto KTP dan NIK terlihat dengan jelas',
          style: myTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Pastikan foto tidak terlalu terang atau terlalu gelap dan tidak terdapat pantulan cahaya pada KTP',
          style: myTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Pastikan foto KTP tidak rotate dan mirroring',
          style: myTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}