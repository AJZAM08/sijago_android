import 'package:flutter/material.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/textsytle.dart';

class TombolPortofolio extends StatelessWidget {
  final String label;
  final dynamic Function() onPressed;
  const TombolPortofolio({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Button.filled(
      onPressed: onPressed,
      color: Colors.blue,
      label: Text(
        label,
        style: myTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteBg),
      ),
    );
  }
}
