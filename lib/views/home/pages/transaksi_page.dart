import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/assets/assets_gen.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/tab_controller.dart';
import '../../../data/controllers/transaction_controller.dart';
import '../widget/transaksi_widget/transaksi_berlangsung.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    var tabCtrl = Get.put<TabControllers>(TabControllers());
    var transactionsCtrl = Get.put<TransactionsController>(TransactionsController());

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Transaksi',
                style: myTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black.withOpacity(.8),
                ),
              ),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: myTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              onTap: tabCtrl.changeTabIndex,
              labelColor: AppColors.primary,
              unselectedLabelColor: Color.fromARGB(255, 166, 166, 166),
              tabs: [
                Tab(text: 'Berlangsung',),
                Tab(text: 'Selesai',),
              ],
            ),
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
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
          body: TabBarView(
            children: [
              Obx(() {
                if (transactionsCtrl.userData.isEmpty) {
                  return Center(child: Text('Tidak Ada Transaksi'));
                } else {
                  // Filter transaksi yang sedang berlangsung
                  var berlangsung = transactionsCtrl.userData
                      .where((transaction) => transaction.status == 'Pesanan Sedang Diproses' || transaction.status == 'Menunggu Pembayaran')
                      .toList();
                  return TransaksiBanner(transactions: berlangsung);
                }
              }),
              Obx(() {
                if (transactionsCtrl.userData.isEmpty) {
                  return Center(child: Text('Tidak Ada Transaksi'));
                } else {
                  // Filter transaksi yang sudah selesai (berhasil atau gagal)
                  var selesai = transactionsCtrl.userData
                      .where((transaction) => transaction.status == 'Berhasil' || transaction.status == 'Gagal')
                      .toList();
                  return TransaksiBanner(transactions: selesai);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}