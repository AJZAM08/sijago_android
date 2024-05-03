import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';

class KeteranganSelfie extends StatelessWidget {
  const KeteranganSelfie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tidak ada hal yang menutupi wajah',
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
          'Foto Lurus, tidak miring atau terbalik',
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
          'Pastikan foto wajah anda terlihat secara menyeluruh dan jelas (tidak buram/gelap, rusak, tertutup jari/pantulan cahaya, dan tidak menggunakan frame foto).',
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
          'Selfie menggunakan wajah yang sama dengan KTP yang diunggah',
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