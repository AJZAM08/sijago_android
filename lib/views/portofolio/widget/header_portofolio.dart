import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/textsytle.dart';
import '../../../data/controllers/data_controller.dart';

class HeaderPort extends StatelessWidget {
  const HeaderPort({super.key});

  @override
  Widget build(BuildContext context) {
    var dataCtrl = Get.find<UserData>();
    var userData = dataCtrl.userData.value!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 53,
      ),
      child: Container(
        width: 350, // Lebar box
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 7),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ').format(
                    double.parse(
                        userData['saldo'].toString().replaceAll(',', ''))),
                style: myTextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 149, 149, 149)),
              ),
              Text(
                'Total Investasi',
                style: myTextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 149, 149, 149)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_outward_sharp,
                    color: Color.fromRGBO(149, 192, 31, 100),
                  ),
                  Text(
                    'Rp 0(0.0%)',
                    style: myTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(149, 192, 31, 100),
                    ),
                  ),
                ],
              ),
              Text(
                'imbal hasil',
                style: myTextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 56, 56, 56)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
