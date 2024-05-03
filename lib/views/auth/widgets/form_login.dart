import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../data/controllers/auth_controller.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Obx(
        () => Form(
          onChanged: () {
            authC.handleLogin();
          },
          key: authC.formKeyLogin,
          child: Column(
            children: [
              CustomTextField(
                onTapOutside: (event) {
                  authC.emailFocusNode.unfocus();
                  authC.passFocusNode.unfocus();
                },
                onFieldSubmitted: (_) {
                  if (authC.formKeyLogin.currentState!.validate()) {
                    return;
                  } else {
                    authC.passFocusNode.requestFocus();
                  }
                },
                controller: authC.emailController.value,
                label: 'Email',
                focusNode: authC.emailFocusNode,
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
                  authC.emailController.value.text = value!;
                },
              ),
              const SizedBox(
                height: 7,
              ),
              CustomTextField(
                onTapOutside: (event) {
                  authC.emailFocusNode.unfocus();
                  authC.passFocusNode.unfocus();
                },
                controller: authC.passController.value,
                label: 'Password',
                focusNode: authC.passFocusNode,
                obscureText: true,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (authC.formKeyLogin.currentState!.validate()) {
                    authC.onClick.isFalse
                        ? authC.login()
                        : authC.onClick.value = true;
                  }
                },
                validator: (value) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return "Password harus diisi!!";
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Password minimal 6 karakter");
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  authC.passController.value.text = value!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
