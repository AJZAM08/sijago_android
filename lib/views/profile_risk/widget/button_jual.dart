import 'package:flutter/material.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/textsytle.dart';

class ButtonJual extends StatelessWidget {
  final String label;
  final String? textGesture;
  final dynamic Function() onPressed;
  final dynamic Function()? onPressGesture;
  const ButtonJual({
    super.key,
    required this.label,
    required this.onPressed,
    this.onPressGesture,
    this.textGesture,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 20),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button.filled(
                  height: 50,
                  width: 170,
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
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
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
          ),
        ],
      ),
    );
  }
}
