import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/data/controllers/data_controller.dart';

import '../../core/assets/assets_gen.dart';
import '../../core/components/custom_snackbar.dart';
// import 'dart:math';
// import '../database_helper.dart';
import '../../core/constant/colors.dart';
import '../models/users_models.dart';
import '../routes/route_name.dart'; // Pastikan ini adalah path yang benar

class AuthController extends GetxController {
  var isPasswordObscured = true.obs;
  var isConfirmPasswordObscured = true.obs;
  var isValid = false.obs;
  var onClick = false.obs;
  var saldo = '0'.obs;

  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyVerify = GlobalKey<FormState>();

  void handleLogin() async {
    isValid.value = formKeyLogin.currentState!.validate();
  }

  void handleRegist() async {
    isValid.value = formKeyRegister.currentState!.validate();
  }

  void handleVerify() async {
    isValid.value = formKeyVerify.currentState!.validate();
  }

  // TextEditingControllers tanpa .obs karena ini tidak perlu reactive
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var emailRegController = TextEditingController().obs;
  var passRegController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var reffController = TextEditingController().obs;
  var verifyController = TextEditingController().obs;

  var usernameFocusNode = FocusNode();
  var emailFocusNode = FocusNode();
  var emailRegFocusNode = FocusNode();
  var passRegFocusNode = FocusNode();
  var passFocusNode = FocusNode();
  var phoneFocusNode = FocusNode();
  var reffFocusNode = FocusNode();
  var verifyFocusNode = FocusNode();

  var isLoggedIn = false.obs;
  var currentUser = Rx<UserModel?>(null);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool verificationDone = false.obs;
  RxBool isResendButtonEnabled = false.obs;
  RxString verificationId = '0'.obs;
  Timer? _timer;
  UserCredential? userCredential;

  Future<void> reloadUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await user?.reload();
      user = FirebaseAuth.instance.currentUser;
      verificationDone.value = user?.emailVerified ?? false;

      if (verificationDone.isTrue) {
        snackBar(
          'Sukses',
          'Email telah terverifikasi',
          AppColors.green,
          Assets.icon.check,
        );
      } else {
        snackBar(
          'Email belum terverifikasi',
          'Silahkan cek email anda',
          AppColors.red,
          Assets.icon.alert,
        );
      }
    } catch (e) {
      Get.snackbar(
          'Error', 'Terjadi kesalahan saat memperbarui informasi pengguna: $e');
    }
  }

  //---------------Email Verify--------------------//

  void sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      Get.toNamed(RouteName.emailVerify);
    } on FirebaseAuthException catch (e) {
      snackBar(
        'Tidak bisa mengirim verifikasi',
        '${e}',
        Color.fromARGB(255, 238, 56, 81),
        Assets.icon.alert,
      );
    }
  }

  //---------------Phone Verify--------------------//

  void sendOTP(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        Get.snackbar("Success", 'Verify yourself');
        await _auth.signOut();
        register();
        Get.toNamed(RouteName.phoneVerify);
      },
      verificationFailed: (FirebaseAuthException e) {
        snackBar(
          'Error',
          'Nomor yang dimasukan tidak tersedia',
          Color.fromARGB(255, 238, 56, 81),
          Assets.icon.alert,
        );
      },
      codeSent: (String verId, int? resendToken) {
        verificationId.value = verId;
        Get.toNamed(RouteName.phoneVerify);
        startResendTimer();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    String otpController = verifyController.value.text;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otpController);

    try {
      await _auth.signInWithCredential(credential);
      await _auth.signOut();
      snackBar(
        'Yeay, Berhasil..',
        'Akun anda telah terverifikasi',
        AppColors.green,
        Assets.icon.check,
      );
      verificationDone.value = true;
      _auth.signInWithEmailAndPassword(
          email: emailRegController.value.text.trim(),
          password: passRegController.value.text.trim());
    } catch (e) {
      snackBar(
        'Upsss',
        'Kode OTP yang dimasukan salah',
        Color.fromARGB(255, 238, 56, 81),
        Assets.icon.alert,
      );
    }
  }

  void startResendTimer() {
    const oneMinute = 60; // Durasi timer dalam detik
    int secondsRemaining = oneMinute;
    isResendButtonEnabled.value =
        false; // Non-aktifkan tombol saat timer berjalan
    _timer?.cancel(); // Batalkan timer sebelumnya jika ada

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        print('Tunggu $secondsRemaining detik untuk mengirim ulang kode.');
      } else {
        isResendButtonEnabled.value = true;
        print(isResendButtonEnabled);
        timer.cancel();
      }
    });
  }

  //---------------Auth Function--------------------//

  void register() async {
    var ctrl = Get.find<UserData>();
    if (reffController.value.text == '654321') {
      saldo.value = '100000';
    }
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailRegController.value.text.trim(),
        password: passRegController.value.text.trim(),
      );
      await _firestore
          .collection('users')
          .doc(userCredential!.user!.email)
          .set({
        'username': usernameController.value.text.trim(),
        'phoneNumber': phoneController.value.text.trim(),
        'email': emailRegController.value.text.trim(),
        'uid': userCredential!.user!.uid,
        'saldo': saldo.value
      });
      await _auth.signInWithEmailAndPassword(
        email: emailRegController.value.text.trim(),
        password: passRegController.value.text.trim(),
      );
      try {
        sendEmailVerification();
        print('berhasil');
      } catch (e) {
        print(e);
      }
      ctrl.fetchUserData(userCredential!.user!.email!);
      Get.toNamed(RouteName.emailVerify);
      snackBar(
        'Yey Akun Berhasil Dibuat',
        'Silahkan verifikasi email anda untuk melanjutkan',
        AppColors.green,
        Assets.icon.check,
      );
    } catch (e) {
      snackBar(
        'Error',
        'Akun sudah ada',
        Color.fromARGB(255, 238, 56, 81),
        Assets.icon.alert,
      );
    }
  }

  void login() async {
    var ctrl = Get.find<UserData>();
    final email = emailController.value.text.trim();
    final password = passController.value.text.trim();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      ctrl.fetchUserData(email);
      if (userCredential!.user!.emailVerified) {
        Get.toNamed(RouteName.dashboard);
        snackBar(
          'Login Berhasil',
          'Selamat Datang Kembali',
          AppColors.green,
          Assets.icon.check,
        );
      } else {
        Get.toNamed(RouteName.emailVerify);
        snackBar(
          'Login Berhasil',
          'harap verifikasi akun anda',
          AppColors.orange,
          Assets.icon.warning,
        );
      }
    } catch (e) {
      snackBar(
        'Upss, Email atau password salah',
        'harap masukan email atau password yang benar',
        Color.fromARGB(255, 238, 56, 81),
        Assets.icon.alert,
      );
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed(RouteName.login);
  }

  @override
  void onClose() {
    _timer?.cancel();
    usernameController.value.dispose();
    emailController.value.dispose();
    emailRegController.value.dispose();
    passRegController.value.dispose();
    passController.value.dispose();
    phoneController.value.dispose();
    reffController.value.dispose();
    verifyController.value.dispose();

    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    emailRegFocusNode.dispose();
    passRegFocusNode.dispose();
    passFocusNode.dispose();
    phoneFocusNode.dispose();
    reffFocusNode.dispose();
    verifyFocusNode.dispose();
    super.onClose();
  }
}
