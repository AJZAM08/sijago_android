import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/textsytle.dart';

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderRadius = 10.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 16.0,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = AppColors.whiteBg,
    this.textColor = AppColors.primary,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 0,
    this.icon,
    this.disabled = false,
    this.fontSize = 16.0,
  });

  final Function() onPressed;
  final Widget label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SizedBox(width: 10.0),
                  label
                ],
              ),
            )
          : ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SizedBox(width: 10.0),
                  label
                ],
              ),
            ),
    );
  }
}


class MyButton extends StatelessWidget {
  final String? label;
  final String? textGesture1;
  final String? textGesture2;
  final dynamic Function()? onPressed;
  final dynamic Function()? onPressGesture;
  final bool? disabled;
  final Color? color;
  const MyButton({
    super.key,
    this.label,
    this.onPressed,
    this.onPressGesture,
    this.textGesture1,
    this.textGesture2,
    this.disabled,
    this.color = AppColors.primary
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          label != null && onPressed != null?
          Button.filled(
            color: color!,
            disabled: disabled ?? false,
            onPressed: onPressed!,
            label: Text(
              label!,
              style: myTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteBg),
            ),
          ) : SizedBox(),
          textGesture2 != null && textGesture1 != null?
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textGesture1!,
                  style: myTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                ),
                InkWell(
                  onTap: onPressGesture,
                  child: Text(
                    textGesture2!,
                    style: myTextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary),
                  ),
                )
              ],
            ),
          ) : SizedBox(height: 20,),
        ],
      ),
    );
  }
}