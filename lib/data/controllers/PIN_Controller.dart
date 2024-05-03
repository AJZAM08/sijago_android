import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/data/controllers/data_controller.dart';

class PINController extends GetxController {
  var ctrl = Get.find<UserData>();
  var pin1 = '123456'.obs;

  

  final GlobalKey<FormState> fromKeyPIN = GlobalKey<FormState>();

  

  var pin1Ctrl = TextEditingController().obs;
  var pin2Ctrl = TextEditingController().obs;
  var pin3Ctrl = TextEditingController().obs;
  var pin4Ctrl = TextEditingController().obs;
  var pin5Ctrl = TextEditingController().obs;
  var pin6Ctrl = TextEditingController().obs;

  var pin1Focus = FocusNode();
  var pin2Focus = FocusNode();
  var pin3Focus = FocusNode();
  var pin4Focus = FocusNode();
  var pin5Focus = FocusNode();
  var pin6Focus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    pin1.value = ctrl.pinCtrl.value.text;
  }
}
