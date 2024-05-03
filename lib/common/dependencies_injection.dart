import 'package:get/get.dart';
import 'package:sijago_android/ai/controller.dart';
import 'package:sijago_android/data/controllers/dropdown_controller.dart';
import 'package:sijago_android/data/controllers/transaction_controller.dart';
import '../data/controllers/auth_controller.dart';
import '../data/controllers/data_controller.dart';
import '../data/controllers/network_controller.dart';
import '../data/controllers/page_controller.dart';
import '../data/controllers/product_controller.dart';
import '../data/controllers/system_controller.dart';
import '../data/controllers/user_controller.dart';
import '../data/controllers/widget_controller.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<ProductController>(ProductController(), permanent: true);
    Get.put<PageControllerX>(PageControllerX(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<UserData>(UserData(), permanent: true);
    Get.put<TextRecognizerController>(TextRecognizerController(), permanent: true);
    Get.put<SystemController>(SystemController(), permanent: true);
    Get.put<DropdownController>(DropdownController(), permanent: true);
    Get.put<TransactionsController>(TransactionsController(), permanent: true);
    Get.put<WidgetController>(WidgetController(), permanent: true);
  }
}