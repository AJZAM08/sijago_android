import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/custom_appbar.dart';
import '../../core/assets/assets_gen.dart';
import '../../core/constant/size.dart';
import '../../core/constant/textsytle.dart';
import '../home/widget/product_widget/search_box.dart';
import 'widget/header_portofolio.dart';
import '../profile_risk/widget/filter_widget.dart';

class Portofolio extends StatelessWidget {
  const Portofolio({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {Get.back();},
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 113, 205),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              Assets.logo.logoSijago,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: fullHeight,
        child: ListView(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 27, vertical: 5),
              child: Text(
                'Portofolio',
                style: myTextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SearchBox(),
            SizedBox(
              height: 20,
            ),
            HeaderPort(),
            PortofolioList(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
