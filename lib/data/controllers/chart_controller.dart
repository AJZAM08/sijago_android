import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'product_controller.dart';

class ChartController extends GetxController {
  var ctrl = Get.find<ProductController>();
  var product;
  var maxX = 0.obs;
  var minX = 0.obs;
  var minY = 0.0.obs;
  var maxY = 0.0.obs;
  RxList<FlSpot> dataHari = [FlSpot(0, 0)].obs;
  RxList<FlSpot> dataMinggu = [FlSpot(0, 0)].obs;
  RxList<FlSpot> dataBulan = [FlSpot(0, 0)].obs;

  var kondisi = 'tahun'.obs;
  RxList<FlSpot> allData = [
    FlSpot(0, 1),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    product = ctrl.allProduct[ctrl.selectedIndex.value];
    maxX.value = ctrl.allProduct[ctrl.selectedIndex.value].productData!.length;
    tambahData();
    calculateMinMax(allData);
  }

  void tambahData() {
    allData.clear();
    var y;
    for (int i = 0; i < ctrl.allProduct[ctrl.selectedIndex.value].productData!.length; i++) {
      y = ctrl.allProduct[ctrl.selectedIndex.value].productData![i].harga;
      print(y);
      double x = i.toDouble();
      var data = FlSpot(x, y);
      allData.add(data);
    }
    calculateMinMax(allData);
  }

  void calculateMinMax(RxList<FlSpot> data) {
    double min = double.infinity;
    double max = -double.infinity;

    for (var spot in data) {
      if (spot.y < min) min = spot.y;
      if (spot.y > max) max = spot.y;
    }

    minY.value = min;
    maxY.value = max;
  }

  void hari() {
    kondisi.value = 'hari';
    dataHari.value = allData.sublist(allData.length - 2);
    calculateMinMax(dataHari);
    maxX.value = allData.length - 1;
    minX.value = allData.length - 2;
  }

  void minggu() {
    kondisi.value = 'minggu';
    dataMinggu.value = allData.sublist(allData.length - 7);
    calculateMinMax(dataMinggu);
    maxX.value = allData.length - 1;
    minX.value = allData.length - 7;
  }

  void bulan() {
    kondisi.value = 'bulan';
    dataBulan.value = allData.sublist(allData.length - 30);
    calculateMinMax(dataBulan);
    maxX.value = allData.length - 1;
    minX.value = allData.length - 30;
  }

  void tahun() {
    kondisi.value = 'tahun';
    calculateMinMax(allData);
    maxX.value = allData.length - 0;
    minX.value = allData.length - 366;
  }
}
