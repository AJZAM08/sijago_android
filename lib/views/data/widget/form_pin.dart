import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/data_controller.dart';

class PINForm extends StatelessWidget {
  const PINForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<UserData>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        // key: authC.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              textAlign: TextAlign.center,
              controller: authC.pinCtrl.value,
              focusNode: authC.pinFocusNode,
              obscureText: true,
              keyboardType: TextInputType.number,
              textStyle: myTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
