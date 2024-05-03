import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import 'package:sijago_android/data/routes/route_name.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/size.dart';
import '../../../data/widget/header_kyc.dart';

class HasilTransaksi extends StatelessWidget {
  final String status;
  const HasilTransaksi({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
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
        body: SizedBox(
          height: fullHeight,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: HeaderKyc(
                        title: status == 'Berhasil'
                            ? 'Pembayaran ${status}'
                            : 'Pembayaran ${status}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 30, right: 30, top: 50),
                      child: SvgPicture.asset(
                        status == 'Berhasil'
                            ? Assets.icon.check
                            : Assets.icon.alert,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: HeaderKyc(
                        subtitle: status == 'Berhasil'
                            ? 'Terimakasih telah membeli reksadana menggunakan SIjago. Unit reksadanamu akan segera diproses. Mohon menunggu maksimal 2 hari kerja. Silahkan hubungi kami jika ada kendala '
                            : 'Kamu telah salah memasukkan PIN rahasia sebanyak 5 kali. Silahkan mencoba kembali setelah 20 menit.',
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: MyButton(
                  label: 'Selanjutnya',
                  onPressed: () {
                    Get.offAllNamed(RouteName.dashboard);
                  },
                  textGesture1: 'Detail Transaksi',
                  onPressGesture: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
