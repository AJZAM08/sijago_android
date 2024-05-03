import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:sijago_android/data/controllers/auth_controller.dart';

class UserData extends GetxController {
  var nikTeks = ''.obs;
  var namaTeks = ''.obs;
  final isValid = false.obs;
  final userCtrl = Get.find<AuthController>();
  final userData = Rx<Map<String, dynamic>?>(null);
  final currentUser = FirebaseAuth.instance.currentUser;

  final GlobalKey<FormState> formKeyDetails = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyBank = GlobalKey<FormState>();

  final nikController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final tempatLahirController = TextEditingController().obs;
  final tanggalLahirController = TextEditingController().obs;
  final jenisKelaminController = TextEditingController().obs;
  final alamatController = TextEditingController().obs;
  final provinsiController = TextEditingController().obs;
  final kabupatenController = TextEditingController().obs;
  final kecamatanController = TextEditingController().obs;
  final kelurahanController = TextEditingController().obs;
  final rtController = TextEditingController().obs;
  final rwController = TextEditingController().obs;
  final kodePosController = TextEditingController().obs;
  final agamaController = TextEditingController().obs;
  final statusController = TextEditingController().obs;
  final rekController = TextEditingController().obs;

  final pinCtrl = TextEditingController().obs;

  final nikFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final tempatFocusNode = FocusNode();
  final tanggalFocusNode = FocusNode();
  final jenisKelaminFocusNode = FocusNode();
  final alamatFocusNode = FocusNode();
  final provinsiFocusNode = FocusNode();
  final kabFocusNode = FocusNode();
  final kecFocusNode = FocusNode();
  final kelFocusNode = FocusNode();
  final rtFocusNode = FocusNode();
  final rwFocusNode = FocusNode();
  final posFocusNode = FocusNode();
  final agamaFocusNode = FocusNode();
  final statusFocusNode = FocusNode();
  final rekFocusNode = FocusNode();
  final pinFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    if (currentUser != null) {
      fetchUserData(currentUser!.email!);
    }
  }

  void handleUserData(GlobalKey<FormState> key) {
    isValid.value = key.currentState?.validate() ?? false;
  }

  void fetchUserData(String email) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        userData.value = snapshot.data();
      } else {
        userData.value = null;
      }
    });
  }

  void tambahData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final users = FirebaseFirestore.instance.collection('users');
      await users.doc(userCtrl.userCredential!.user!.email).update({
        'nik': nikController.value.text,
        'nama lengkap': nameController.value.text,
        'tempat lahir': tempatLahirController.value.text,
        'tanggal lahir': tanggalLahirController.value.text,
        'jenis kelamin': jenisKelaminController.value.text,
        'alamat': alamatController.value.text,
        'provinsi': provinsiController.value.text,
        'kabupaten': kabupatenController.value.text,
        'kecamatan': kecamatanController.value.text,
        'kelurahan': kelurahanController.value.text,
        'rt': rtController.value.text,
        'rw': rwController.value.text,
        'pos': kodePosController.value.text,
        'agama': agamaController.value.text,
        'status': statusController.value.text,
        'profileRef': null,
      });
    }
  }

  void updateData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final users = FirebaseFirestore.instance.collection('users');
      await users.doc(userCtrl.userCredential!.user!.email).update({
        'nik': nikController.value.text,
        'nama lengkap': nameController.value.text,
        'tempat lahir': tempatLahirController.value.text,
        'tanggal lahir': tanggalLahirController.value.text,
        'jenis kelamin': jenisKelaminController.value.text,
        'alamat': alamatController.value.text,
        'provinsi': provinsiController.value.text,
        'kabupaten': kabupatenController.value.text,
        'kecamatan': kecamatanController.value.text,
        'kelurahan': kelurahanController.value.text,
        'rt': rtController.value.text,
        'rw': rwController.value.text,
        'pos': kodePosController.value.text,
        'agama': agamaController.value.text,
        'status': statusController.value.text,
        'profileRef': null,
      });
    }
  }

  void updatePortofolio(var nominal) async {
    int saldoInt = int.parse(userData.value!['saldo'].replaceAll(',', ''));
    int nominalInt = int.parse(nominal.replaceAll(',', ''));
    int total = saldoInt + nominalInt;
    String totalString = NumberFormat('#,###').format(total);
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final users = FirebaseFirestore.instance.collection('users');
      await users.doc(user.email).update({'saldo': totalString});
    }
  }
}
