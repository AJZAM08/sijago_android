import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/views/profile_risk/risk_profile4.dart';

import '../../../../../../core/components/custom_appbar.dart';
import '../../../core/constant/textsytle.dart';
import 'widget/button_next.dart';
import 'widget/button_pilih.dart';

class RiskProfile3 extends StatelessWidget {
  const RiskProfile3({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 113, 205),
                  )),
            ],
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  child: Text(
                    'Langkah 3 dari 5',
                    style: myTextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 127, 127, 127)),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Investasi saya/kami sebagai perbandingan dari jumlah atau aktiva/harta kekayaan, kira-kira adalah sebesar?',
                  style: myTextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 118, vertical: 50),
                      child: Container(
                        child: Icon(
                          Icons.photo_size_select_actual_rounded,
                          size: 220,
                        ),
                      ),
                    ),
                    SelectableBox(boxTextList: ['< 50%', '51 - 75%', '> 75%']),
                    SizedBox(
                      height: 180,
                    ),
                    ButtonNext(
                        label: 'Selanjutnya',
                        onPressed: () {
                          Get.to(() => RiskProfile4());
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
