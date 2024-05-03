import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/data/routes/route_name.dart';
import 'package:sijago_android/views/transactions/widget/header_produk.dart';
import 'package:sijago_android/views/transactions/widget/informasi_produk.dart';

import '../../../../../core/components/custom_appbar.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/widget_controller.dart';

class BeliPage extends StatelessWidget {
  const BeliPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<WidgetController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 113, 205),
                )),
            Text(
              'Beli Reksadana',
              style: myTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black.withOpacity(.7),
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                child: Image.asset(
                  Assets.logo.logoSijago,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          HeaderProduk(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InformasiProduk(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 7),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Jumlah Pembelian',
                        textAlign: TextAlign.center,
                        style: myTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Rp.',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                controller.updateNominal(
                                    controller.nominalController.value.text);
                              },
                              style: myTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              controller: controller.nominalController.value,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                hintText: 'Min 100,000',
                                hintStyle: myTextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                              inputFormatters: [controller.formatter],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 10.0,
                        children: [
                          _buildTextButton('100,000'),
                          _buildTextButton('200,000'),
                          _buildTextButton('500,000'),
                          _buildTextButton('1,000,000'),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: controller.containerColor.value,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(
                                      'Investasi Rutin',
                                      style: TextStyle(
                                        color: controller.switchValue.value
                                            ? Color.fromARGB(255, 255, 255, 255)
                                            : Color.fromARGB(
                                                255, 158, 158, 158),
                                        fontSize: 18,
                                      ),
                                    )),
                                Obx(() => Switch(
                                      value: controller.switchValue.value,
                                      onChanged: (newValue) {
                                        controller.toggleSwitch(newValue);
                                      },
                                      activeColor: Colors.white,
                                      inactiveTrackColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //Checkbox
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, 7),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (value) =>
                                controller.toggleCheckbox(value!),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() => AnimatedSize(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                      child: Text(
                                        'Saya menyetujui pembelian reksa dana di halaman ini dan telah membaca dan menyetujui seluruh isi Prospektus dan keterangan ringkas serta memahami risiko atas keputusan investasi yang saya buat. ',
                                        overflow: TextOverflow.fade,
                                        maxLines: controller.isExpanded.value
                                            ? null
                                            : 2,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 5),
                                GestureDetector(
                                  onTap: controller.toggleExpansion,
                                  child: Text(
                                    controller.isExpanded.value
                                        ? 'Tutup'
                                        : 'Baca selengkapnya',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                //Button Bayar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: myTextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                      Obx(
                        () => Text(
                          'Rp. ${controller.nominal.value}',
                          style: myTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => MyButton(
                    disabled: controller.isChecked.isTrue ? false : true,
                    label: 'Bayar Sekrang',
                    onPressed: () {
                      Get.toNamed(RouteName.metodeBayar);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextButton(String amount) {
    final WidgetController controller = Get.put(WidgetController());
    return TextButton(
      onPressed: () => controller.updateNominal(amount),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        elevation: 5, // Reduced elevation for a more subtle shadow
      ),
      child: Text(
        amount,
        style: TextStyle(
          fontSize: 14, // Slightly increased font size for better readability
          color: Colors.black,
        ),
      ),
    );
  }
}
