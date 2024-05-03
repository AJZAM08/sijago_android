import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/constant/colors.dart';

import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/product_controller.dart';

class InformasiProduk extends StatelessWidget {
  const InformasiProduk({super.key});

  @override
  Widget build(BuildContext context) {
    var productCtrl = Get.find<ProductController>();
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Informasi Produk',
            textAlign: TextAlign.center,
            style: myTextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harga/Unit Terakhir',
                    style: myTextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    productCtrl.allProduct[productCtrl.selectedIndex.value].productData!.last.tanggal ?? '',
                    style: myTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.blue.shade400,
                    ),
                  ),
                ],
              ),
              Text(
                productCtrl.allProduct[productCtrl.selectedIndex.value].productData!.last.harga.toString(),
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
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
                'Minimum Pembelian',
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              Text(
                'Rp. 50.000',
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Biaya Pembelian',
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              Text(
                'Rp. 0',
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Biaya Admin',
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              Text(
                'Rp. 0',
                style: myTextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Aksi yang diambil ketika tombol pertama ditekan
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Prospektus',
                    style: myTextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  // Aksi yang diambil ketika tombol kedua ditekan
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    'Fun Fact Sheet',
                    style: myTextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
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
    );
  }
}
