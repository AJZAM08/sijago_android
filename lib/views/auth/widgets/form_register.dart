import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/custom_textfield.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/auth_controller.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Obx(
        () => Column(
          children: [
            Form(
              onChanged: () => authC.handleRegist(),
              key: authC.formKeyRegister,
              child: Column(
                children: [
                  CustomTextField(
                    onFieldSubmitted: (_) {
                      if (authC.formKeyRegister.currentState!.validate()) {
                        return;
                      } else {
                        authC.emailRegFocusNode.requestFocus();
                      }
                    },
                    onTapOutside: (event) {
                      authC.usernameFocusNode.unfocus();
                      authC.emailRegFocusNode.unfocus();
                      authC.phoneFocusNode.unfocus();
                      authC.passRegFocusNode.unfocus();
                      authC.reffFocusNode.unfocus();
                    },
                    controller: authC.usernameController.value,
                    label: 'Username',
                    focusNode: authC.usernameFocusNode,
                    autocorrect: true,
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Username harus diisi!!";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      authC.usernameController.value.text = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onFieldSubmitted: (_) {
                      if (authC.formKeyRegister.currentState!.validate()) {
                        return;
                      } else {
                        authC.phoneFocusNode.requestFocus();
                      }
                    },
                    onTapOutside: (event) {
                      authC.usernameFocusNode.unfocus();
                      authC.emailRegFocusNode.unfocus();
                      authC.phoneFocusNode.unfocus();
                      authC.passRegFocusNode.unfocus();
                      authC.reffFocusNode.unfocus();
                    },
                    controller: authC.emailRegController.value,
                    label: 'Email',
                    focusNode: authC.emailRegFocusNode,
                    autocorrect: true,
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Email harus diisi!!";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Email wajib pakai @****");
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      authC.emailRegController.value.text = value!;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onFieldSubmitted: (_) {
                      if (authC.formKeyRegister.currentState!.validate()) {
                        return;
                      } else {
                        authC.passRegFocusNode.requestFocus();
                      }
                    },
                    onTapOutside: (event) {
                      authC.usernameFocusNode.unfocus();
                      authC.emailRegFocusNode.unfocus();
                      authC.phoneFocusNode.unfocus();
                      authC.passRegFocusNode.unfocus();
                      authC.reffFocusNode.unfocus();
                    },
                    prefIcon: Container(
                      width: 70,
                      child: Center(
                        child: Text(
                          '+62',
                          style: myTextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    controller: authC.phoneController.value,
                    label: 'Nomor Handphone',
                    focusNode: authC.phoneFocusNode,
                    keyboardType: TextInputType.phone,
                    autocorrect: true,
                    validator: (value) {
                      if (value!.length == 0) {
                        return "Nomor Handphone harus diisi!!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onFieldSubmitted: (_) {
                      if (authC.formKeyRegister.currentState!.validate()) {
                        return;
                      } else {
                        authC.reffFocusNode.requestFocus();
                      }
                    },
                    onTapOutside: (event) {
                      authC.usernameFocusNode.unfocus();
                      authC.emailRegFocusNode.unfocus();
                      authC.phoneFocusNode.unfocus();
                      authC.passRegFocusNode.unfocus();
                      authC.reffFocusNode.unfocus();
                    },
                    controller: authC.passRegController.value,
                    label: 'Password',
                    focusNode: authC.passRegFocusNode,
                    obscureText: true,
                    autocorrect: true,
                    validator: (value) {
                      RegExp upper = new RegExp(r'[A-Z]');
                      RegExp lowwer = new RegExp(r'[a-z]');
                      RegExp digit = new RegExp(r'\d');
                      RegExp special = new RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                      if (value!.isEmpty) {
                        return "Password harus diisi!!";
                      }
                      if (value.length > 16 || value.length < 8) {
                        return 'Password tidak boleh lebih dari 16 dan kurang dari 8';
                      }
                      if (!upper.hasMatch(value)) {
                        return 'Password harus mempunyai huruf besar';
                      }
                      if (!lowwer.hasMatch(value)) {
                        return 'Password harus mempunyai huruf kecil';
                      }
                      if (!digit.hasMatch(value)) {
                        return 'Password harus memiliki angka';
                      }
                      if (!special.hasMatch(value)) {
                        return 'Password harus memiliki karakter khusus';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      authC.passRegController.value.text = value!;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Minimal 16 karakter, mengandung huruf besar, kecil, angka dan karakter khusus',
                style: myTextStyle(
                  color: AppColors.grey.withOpacity(.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // CustomTextField(
            //   onTapOutside: (event) {
            //     authC.usernameFocusNode.unfocus();
            //     authC.emailRegFocusNode.unfocus();
            //     authC.phoneFocusNode.unfocus();
            //     authC.passRegFocusNode.unfocus();
            //     authC.reffFocusNode.unfocus();
            //   },
            //   controller: authC.reffController.value,
            //   label: 'Referral',
            //   focusNode: authC.reffFocusNode,
            //   autocorrect: true,
            // ),
          ],
        ),
      ),
    );
  }
}
