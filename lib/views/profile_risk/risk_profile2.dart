import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/components/custom_appbar.dart';
import '../../../core/constant/textsytle.dart';
import 'risk_profile3.dart';
import 'widget/button_next.dart';
import 'widget/button_pilih.dart';

class RiskProfile2 extends StatelessWidget {
  const RiskProfile2({Key? key});

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
                    'Langkah 2 dari 5',
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
                  'Bagaimana pengalaman Investasi Anda?',
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
                    SelectableBox(boxTextList: ['Terbatas', 'Sedang', 'Luas']),
                    SizedBox(
                      height: 220,
                    ),
                    ButtonNext(
                        label: 'Selanjutnya',
                        onPressed: () {
                          Get.to(() => RiskProfile3());
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
