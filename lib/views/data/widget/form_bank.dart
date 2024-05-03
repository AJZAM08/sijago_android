import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../data/controllers/data_controller.dart';

class FormBank extends StatelessWidget {
  const FormBank({super.key});

  @override
  Widget build(BuildContext context) {
    var detC = Get.find<UserData>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => Form(
          onChanged: () => detC.handleUserData(detC.formKeyBank),
          key: detC.formKeyBank,
          child: Column(
            children: [
              CustomDropdown(),
              SizedBox(height: 10,),
              CustomTextField(
                keyboardType: TextInputType.number,
                controller: detC.rekController.value,
                label: 'Nomor Rekening',
                focusNode: detC.rekFocusNode,
                autocorrect: true,
                onFieldSubmitted: (_) {
                  if (detC.formKeyDetails.currentState!.validate()) {
                    return;
                  } else {
                    detC.rekFocusNode.unfocus();
                  }
                },
                validator: (value) {
                  if (value!.length == 0) {
                    return "Nomor Rekening harus diisi!!";
                  }
                  return null;
                },
                onChanged: (value) {
                  detC.rekController.value.text = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
