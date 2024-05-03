import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/data/routes/route_name.dart';
import '../../../core/components/custom_textfield.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/PIN_Controller.dart';
import '../../../data/controllers/timer_controller.dart';
import '../../../data/controllers/widget_controller.dart';

class PINPayment extends StatelessWidget {
  const PINPayment({super.key});

  @override
  Widget build(BuildContext context) {
    var timer = Get.put(CountdownController());
    final authC = Get.put<PINController>(PINController());
    var controller = Get.find<WidgetController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        onChanged: () {
          if (authC.fromKeyPIN.currentState!.validate()) {
            controller.generateRandomCode();
            Get.offNamed(RouteName.prosesBayar);
            timer.addTransactionProcess();
            timer.startCountdown();
          } 
        },
        key: authC.fromKeyPIN,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              textAlign: TextAlign.center,
              controller: authC.pin1Ctrl.value,
              focusNode: authC.pin1Focus,
              obscureText: true,
              keyboardType: TextInputType.number,
              textStyle: myTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              validator: (value) {
                if (value != authC.pin1.value) {
                  return 'PIN Anda Salah';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
