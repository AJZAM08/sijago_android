import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/colors.dart';
import '../constant/textsytle.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      onSelected: (value) {
        if (value != null) {
          value = value;
        }
      },
      width: Get.width * .91,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: myTextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        fillColor: AppColors.greyBg,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        labelStyle: myTextStyle(color: AppColors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 3,
          ),
        ),
      ),
      label: Text(
        'Pilih Bank',
        style: myTextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      enableSearch: false,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'BCA', label: 'BCA'),
        DropdownMenuEntry(value: 'Mandiri', label: 'Mandiri'),
        DropdownMenuEntry(value: 'BRI', label: 'BRI'),
      ],
    );
  }
}
