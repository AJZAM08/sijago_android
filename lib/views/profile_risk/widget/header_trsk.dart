import 'package:flutter/material.dart';

import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/size.dart';

class HeaderTrsk extends StatelessWidget {
  const HeaderTrsk({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Transaksi',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150),
          child: Container(height: fullHeight*.1, color: Colors.blue,),
        ),
      ),
    );
  }
}