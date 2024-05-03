import 'package:flutter/material.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/textsytle.dart';

class ButtonUbah extends StatelessWidget {
  final String label;
  final String? textGesture;
  final dynamic Function() onPressed;
  final dynamic Function()? onPressGesture;
  const ButtonUbah({
    super.key,
    required this.label,
    required this.onPressed,
    this.onPressGesture,
    this.textGesture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Button.filled(
            color: Colors.blue,
            onPressed: onPressed,
            label: Text(
              label,
              style: myTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteBg),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onPressGesture,
                  child: Text(
                    textGesture != null ? textGesture! : '',
                    style: myTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
