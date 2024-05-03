
import 'package:get/get.dart';
import 'package:sijago_android/data/controllers/transaction_controller.dart';

class PortofolioController extends GetxController {
  var ctrl = Get.find<TransactionsController>();

  var filteredProducts = <UserProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    filterProducts('All');
  }

  void filterProducts(String category) {
    if (category == 'All') {
      filteredProducts.value = ctrl.userProduct;
    } else {
      filteredProducts.value = ctrl.userProduct.where((product) => product.description!.toLowerCase().startsWith(category.toLowerCase())).toList();
    }
  }
}
