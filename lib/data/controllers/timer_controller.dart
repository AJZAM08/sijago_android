import 'package:get/get.dart';
import 'package:sijago_android/data/routes/route_name.dart';

import 'product_controller.dart';
import 'transaction_controller.dart';
import 'widget_controller.dart';

class CountdownController extends GetxController {
  var transactions = Get.find<TransactionsController>();
  var productCtrl = Get.find<ProductController>();
  var controller = Get.find<WidgetController>();
  RxInt remainingTime = 300.obs;
  bool isRunning = true;
  bool isTransactionAdded = false;  // Flag to check if transaction is added

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void addTransactionProcess() {
    if (!isTransactionAdded) {  // Check if transaction is already added
      if (controller.activeIndex.value == 0) {
        transactions.addProductTransaction(
          productCtrl.allProduct[productCtrl.selectedIndex.value].name,
          'Pembelian',
          controller.nominal.value,
          'Link Aja',
          'Menunggu Pembayaran',
        );
      } else {
        transactions.addProductTransaction(
          productCtrl.allProduct[productCtrl.selectedIndex.value].name,
          'Pembelian',
          controller.nominal.value,
          'BNI',
          'Menunggu Pembayaran',
        );
      }
      isTransactionAdded = true;  // Set flag to true after adding transaction
    }
  }

  void startCountdown() {
    if (!isTransactionAdded) {  // Ensure transaction is added once
      addTransactionProcess();
    }
    Future.delayed(Duration(seconds: 1), () {
      if (isRunning && remainingTime.value > 0) {
        remainingTime.value--;
        startCountdown();
      } else if (isRunning && remainingTime.value == 0) {
        processTimeout();
      }
    });
  }

  void processTimeout() {
    if (Get.currentRoute == RouteName.prosesBayar) {
      transactions.updateProductTransaction('Gagal');
      Get.offAllNamed(RouteName.transaksiGagal);
    } else {
      transactions.updateProductTransaction('Gagal');
    }
  }

  void stopCountdown() {
    isRunning = false;
  }
}

