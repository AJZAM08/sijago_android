import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../core/assets/assets_gen.dart';
import '../../core/constant/textsytle.dart';
import '../../data/controllers/transaction_controller.dart';
import '../profile_risk/widget/tracking.dart';
import '../transactions/widget/produk_info.dart';

class TransaksiList3 extends StatelessWidget {
  final index;
  const TransaksiList3({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<TransactionsController>();
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
              'Detail Transaksi',
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
          ProdukInfo(transactions: ctrl.userData[index],),
          Tracking(transactions: ctrl.userData[index],),
        ],
      ),
    );
  }
}
