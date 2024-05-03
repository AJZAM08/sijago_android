import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/route_name.dart';

class UserController extends GetxController {
  var isFirstTime = true.obs;
  final _auth = FirebaseAuth.instance;
  Rxn<User?> _firebaseUser = Rxn<User?>();
  User? get getUser => _auth.currentUser;
  String get getUserEmail => getUser?.email ?? '';
  String get getUserID => getUser?.uid ?? '';

  @override
  void onInit() {
    super.onInit();
    checkIsFirstTime();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> saveUserStatus(bool status) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isFirstTime', status);
      isFirstTime.value = status;
    } catch (e) {
      print("Error saving user status: $e");
    }
  }

  Future<void> checkIsFirstTime() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      isFirstTime.value = prefs.getBool('isFirstTime') ?? true;

      if (isFirstTime.value) {
        print(isFirstTime.value);
        await Future.delayed(const Duration(seconds: 3));
        Get.offNamed(RouteName.onBoarding);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        if (getUser != null) {
          if (getUser!.emailVerified) {
            Get.offNamed(RouteName.dashboard);
          } else {
            Get.offNamed(RouteName.emailVerify);
          }
        } else {
          Get.offNamed(RouteName.login);
        }
      }
    } catch (e) {
      print("Error checking user status: $e");
    }
  }
}
