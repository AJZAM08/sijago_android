import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/textsytle.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String? value)? validator;

  const CustomDropdown({
    Key? key,
    this.label,
    required this.items,
    this.value,
    this.onChanged,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validatedValue = (value != null && items.contains(value)) ? value : null;

    return DropdownButtonFormField<String>(
      isDense: true,
      iconSize: 20,
      menuMaxHeight: 200,
      validator: validator,
      style: myTextStyle(color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 16),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        labelText: label ?? 'Select an option',  // Fallback label if none is provided
        alignLabelWithHint: true,
        fillColor: AppColors.greyBg,
        filled: true,
        labelStyle: myTextStyle(color: AppColors.grey),
        floatingLabelStyle: myTextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 3,
          ),
        ),
      ),
      items: items.map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      )).toList(),
      value: validatedValue,  // This will be null if no initial value matches the items
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}

