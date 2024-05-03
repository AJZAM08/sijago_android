import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/custom_textfield.dart';
import '../../../data/controllers/auth_controller.dart';

class VerifyForm extends StatelessWidget {
  const VerifyForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDigit(String s) => s.isNotEmpty && int.tryParse(s) != null;
    final authC = Get.find<AuthController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        onChanged: () {
          authC.handleVerify();
        },
        key: authC.formKeyVerify,
        child: Column(
          children: [
            CustomTextField(
                onTapOutside: (event) {
                  authC.verifyFocusNode.unfocus();
                },
                onFieldSubmitted: (_) {
                  if (authC.formKeyVerify.currentState!.validate()) {
                    return;
                  } else {
                    authC.verifyFocusNode.unfocus();
                  }
                },
                controller: authC.verifyController.value,
                label: 'Kode OTP',
                focusNode: authC.verifyFocusNode,
                autocorrect: true,
                validator: (value) {
                  if (value == null || value.isEmpty || !isDigit(value)) {
                    return '';
                  } return null;
                },
                onSaved: (value) {
                  authC.verifyController.value.text = value!;
                },
              ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
