import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/textsytle.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final Function(String value)? onChanged;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Function(String value)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final bool autocorrect;
  final bool? readOnly;
  final FloatingLabelBehavior? float;
  final Widget? suffIcon;
  final Widget? prefIcon;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String?)? onSaved;
  final Color? validationColor;
  final void Function()? onTap;
  final String? initialValue;

  const CustomTextField({
    super.key,
    this.controller,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.textStyle,
    this.label,
    this.onChanged,
    this.obscureText = false,
    this.focusNode,
    this.keyboardType,
    this.onFieldSubmitted,
    this.validator,
    this.autocorrect = true,
    this.float = FloatingLabelBehavior.auto,
    this.suffIcon,
    this.onTapOutside,
    this.onSaved,
    this.validationColor,
    this.prefIcon,
    this.readOnly,
    this.onTap, this.initialValue,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      readOnly: readOnly ?? false,
      onSaved: onSaved,
      onTapOutside: onTapOutside,
      textAlign: textAlign!,
      style: textStyle ??
          myTextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
      keyboardType: keyboardType,
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged != null
          ? (value) {
              onChanged!(value);
            }
          : null,
      obscureText: obscureText,
      maxLength: maxLength,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        prefixIcon: prefIcon,
        suffixIcon: suffIcon,
        floatingLabelStyle: myTextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        fillColor: AppColors.greyBg,
        filled: true,
        counterText: '',
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        labelText: label,
        labelStyle: myTextStyle(color: AppColors.grey),
        floatingLabelBehavior: float,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: validationColor == null
              ? BorderSide.none
              : BorderSide(
                  color: validationColor!,
                  width: 3,
                ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 3,
          ),
        ),
      ),
    );
  }
}
