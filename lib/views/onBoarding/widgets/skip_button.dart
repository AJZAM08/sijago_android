import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        'Skip',
        style: myTextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.primary
        ),
      ),
    );
  }
}
