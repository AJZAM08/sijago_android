import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WidgetController extends GetxController {
  // Widget Auto Nominal
  final RxString nominal = ''.obs;
  var nominalController = TextEditingController().obs;

  void updateNominal(String value) {
    nominal.value = value;
    nominalController.value.text = nominal.value;
  }

  // Widget Toggle Switch
  var switchValue = false.obs;
  var containerColor = Color.fromARGB(255, 244, 244, 244).obs;

  void toggleSwitch(bool value) {
    switchValue.value = value;
    containerColor.value = value ? Colors.blue : Color.fromARGB(255, 244, 244, 244);
  }

  // Widget Toogle CheckBox
  var isChecked = false.obs;
  var isExpanded = false.obs;

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  // Widget Toogle Selection
  var activeIndex = Rx<int?>(null);

  void setActiveIndex(int index) {
    activeIndex.value = index;
  }

  // Random Code
  RxString randomCode = ''.obs;

  void generateRandomCode() {
    final random = Random();
    String code = '';
    for (int i = 0; i < 16; i++) {
      code += random.nextInt(10).toString();
    }
    randomCode.value = code;
  }

   late final TextInputFormatter formatter;

  WidgetController() {
    formatter = TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.isEmpty) {
        return newValue;
      }
      final digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
      final num = int.tryParse(digitsOnly);
      if (num == null) {
        return oldValue;
      }
      final formatter = NumberFormat('#,###');
      final newText = formatter.format(num);
      return newValue.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length));
    });
  }
}
