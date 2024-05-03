import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/data/routes/route_name.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/chart_controller.dart';
import '../../../../data/controllers/product_controller.dart';

class ChartProduct extends StatelessWidget {
  final int index;
  const ChartProduct({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var chartCtrl = Get.put(ChartController());
    var ctrl = Get.find<ProductController>();
    var product = ctrl.allProduct[index];
    return Column(
      children: [
        // Header
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: fullHeight - fullHeight * 90 / 100,
          decoration: BoxDecoration(
            color: AppColors.whiteBg,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 1),
                blurRadius: 4,
                color: AppColors.black.withOpacity(.2),
              ),
            ],
          ),
          child: product.productData!.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'NAV',
                          style: myTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black150,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          product.productData!.last.tanggal ?? '',
                          style: myTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black150,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Rp. ' + product.productData!.last.harga.toString(),
                      style: myTextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Text(
                          product.productData!.last.perubahanHarian.toString(),
                          style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: product.productData!.last.perubahanHarian < 0
                                ? AppColors.red
                                : AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : CircularProgressIndicator(),
        ),
        SizedBox(
          height: 10,
        ),
        //Chart
        Expanded(
          child: Obx(
            () => Container(
              height: 150,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          FlLine(color: AppColors.primary, strokeWidth: 2),
                          FlDotData(
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                              radius: 5,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    enabled: true,
                    getTouchLineStart: (barData, spotIndex) =>
                        chartCtrl.minY.value,
                    getTouchLineEnd: (barData, spotIndex) =>
                        chartCtrl.maxY.value,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: 4,
                      tooltipBgColor: Colors.white,
                    ),
                  ),
                  gridData: FlGridData(
                    drawVerticalLine: false,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: chartCtrl.kondisi == 'hari'
                          ? chartCtrl.dataHari
                          : chartCtrl.kondisi == 'minggu'
                              ? chartCtrl.dataMinggu
                              : chartCtrl.kondisi == 'bulan'
                                  ? chartCtrl.dataBulan
                                  : chartCtrl.allData,
                      isCurved: true,
                      color: AppColors.primary,
                      isStrokeJoinRound: true,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(104, 0, 92, 154),
                            AppColors.whiteBg
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  minX: chartCtrl.minX.value.toDouble(),
                  maxX: chartCtrl.maxX.value.toDouble(),
                  minY: chartCtrl.minY.value,
                  maxY: chartCtrl.maxY.value,
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        //Filter
        Container(
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    chartCtrl.hari();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: chartCtrl.kondisi.value == 'hari'
                          ? AppColors.primary
                          : AppColors.whiteBg,
                    ),
                    child: Text(
                      '1D',
                      style: myTextStyle(
                        fontSize: 16,
                        color: chartCtrl.kondisi.value == 'hari'
                            ? AppColors.whiteBg
                            : AppColors.black150,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    chartCtrl.minggu();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: chartCtrl.kondisi.value == 'minggu'
                          ? AppColors.primary
                          : AppColors.whiteBg,
                    ),
                    child: Text(
                      '7D',
                      style: myTextStyle(
                        fontSize: 16,
                        color: chartCtrl.kondisi.value == 'minggu'
                            ? AppColors.whiteBg
                            : AppColors.black150,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    chartCtrl.bulan();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: chartCtrl.kondisi.value == 'bulan'
                          ? AppColors.primary
                          : AppColors.whiteBg,
                    ),
                    child: Text(
                      '1M',
                      style: myTextStyle(
                        fontSize: 16,
                        color: chartCtrl.kondisi.value == 'bulan'
                            ? AppColors.whiteBg
                            : AppColors.black150,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    chartCtrl.tahun();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: chartCtrl.kondisi.value == 'tahun'
                          ? AppColors.primary
                          : AppColors.whiteBg,
                    ),
                    child: Text(
                      '1Y',
                      style: myTextStyle(
                        fontSize: 16,
                        color: chartCtrl.kondisi.value == 'tahun'
                            ? AppColors.whiteBg
                            : AppColors.black150,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 20),
        //Box Info
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: fullWidth,
          decoration: BoxDecoration(
            color: AppColors.whiteBg,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 1),
                  blurRadius: 4,
                  color: AppColors.black.withOpacity(.2))
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Informasi Produk',
                style: myTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Minimum Pembelian',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                  Text(
                    'Rp. 100.000',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 2, 145, 255)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Dana Kelolaan (AUM)',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                  Text(
                    'Rp. 1.200.000.000',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 2, 145, 255)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tingkat Risiko',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                  Text(
                    'Rendah',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 2, 145, 255)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bank Kustodian',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                  Text(
                    'CIMB Niaga',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 2, 145, 255)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bank Penampung',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                  Text(
                    'CIMB Niaga',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 2, 145, 255)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyButton(
                      textGesture2: 'Prospektus',
                      onPressGesture: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: MyButton(
                      textGesture2: 'Fund Fact Sheet',
                      onPressGesture: () {},
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10,),
            ],
          ),
        ),

        SizedBox(
          height: 20,
        ),
        //Box Alokasi
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: fullWidth,
          decoration: BoxDecoration(
            color: AppColors.whiteBg,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 1),
                blurRadius: 4,
                color: AppColors.black.withOpacity(.2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Alokasi Aset',
                style: myTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LinearPercentIndicator(
                lineHeight: 30,
                percent: .45,
                progressColor: const Color.fromARGB(255, 104, 255, 90),
                backgroundColor: AppColors.blue,
                barRadius: Radius.circular(20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Color.fromARGB(255, 104, 255, 90),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Obligasi',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Text(
                    '45%',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.blue,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Pasar Uang',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Text(
                    '55%',
                    style: myTextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black.withOpacity(.8)),
                  ),
                ],
              ),
              Divider(),
              Text(
                'Daftar Alokasi Aset',
                style: myTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '- Sukuk SIEX769',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- Sukuk SUNINJB990',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- TD Bank BTN Syariah',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- TD Bank BRI Syariah',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Text(
                'Produk Yang Bisa Dialihkan',
                style: myTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '- PNM Dana Tunai',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- PNM Amanah Syariah',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- PNM Ekuitas Syariah',
                        style: myTextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black.withOpacity(.5)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MyButton(label: 'Beli Sekarang', onPressed: () {
          Get.toNamed(RouteName.pembelian);
        })
      ],
    );
  }
}
