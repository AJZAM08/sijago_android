import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/core/components/custom_textfield.dart';
import 'package:sijago_android/data/controllers/timer_controller.dart';
import 'package:sijago_android/data/routes/route_name.dart';

import '../../../../../core/components/custom_appbar.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/data_controller.dart';
import '../../../../data/controllers/product_controller.dart';
import '../../../../data/controllers/transaction_controller.dart';
import '../../../../data/controllers/widget_controller.dart';

class ProsesBayar extends StatelessWidget {
  const ProsesBayar({Key? key});

  @override
  Widget build(BuildContext context) {
    var timer = Get.find<CountdownController>();
    var productCtrl = Get.find<ProductController>();
    var controller = Get.find<WidgetController>();
    var transactions = Get.find<TransactionsController>();
    var portofolio = Get.find<UserData>();
    var nomor = TextEditingController();
    var pin = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: IconButton(
            onPressed: () {
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
                  'Bank BNI',
                  'Menunggu Pembayaran',
                );
              }
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    '5 Menit',
                    style: myTextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    child: Text(
                      controller.activeIndex.value == 0
                          ? 'Silahkan menyelesaikan pembayaran melalui aplikasi LinkAja kamu. Pastikan saldo tersimpan mencukupi.'
                          : 'Silahkan menyelesaikan pembayaran melalui Bank BNI kamu. Pastikan kode VirtualAccount sudah sesuai',
                      textAlign: TextAlign.justify,
                      style: myTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    controller.activeIndex.value == 0
                        ? 'Nomor Handphone'
                        : 'Virtual Account',
                    style: myTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: controller.activeIndex.value == 1
                      ? Obx(
                          () => CustomTextField(
                            readOnly: true,
                            initialValue: controller.randomCode.value,
                            suffIcon: IconButton(
                              icon: Icon(Icons.content_copy),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                    text: controller.randomCode.value));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Copied to Clipboard')),
                                );
                              },
                            ),
                          ),
                        )
                      : CustomTextField(
                          keyboardType: TextInputType.phone,
                          controller: nomor,
                          label: "Masukan Nomor Handphone",
                        ),
                ),
                SizedBox(height: 10),
                controller.activeIndex.value == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'LinkAja PIN',
                          style: myTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 10),
                controller.activeIndex.value == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomTextField(
                          controller: pin,
                          label: "Masukan PIN LinkAja",
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: myTextStyle(
                          color: AppColors.black.withOpacity(.7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Rp. ${controller.nominal.value}',
                        style: myTextStyle(
                          color: AppColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  label: 'Bayar Sekrang',
                  onPressed: () {
                    timer.stopCountdown();
                    transactions.updateProductTransaction(
                      'Berhasil',
                    );
                    portofolio.updatePortofolio(controller.nominal.value);
                    Get.offAllNamed(RouteName.transaksiBerhasil);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
