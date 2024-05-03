import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/data_controller.dart';

class DashHeader extends StatelessWidget {
  const DashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var dataCtrl = Get.find<UserData>();
    var userData = dataCtrl.userData.value!;
    return Container(
      height: fullHeight * .25,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Investasi',
                      style: myTextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withOpacity(.7)),
                    ),
                    userData.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id_ID', symbol: 'IDR ')
                                    .format(double.parse(userData['saldo']
                                        .toString()
                                        .replaceAll(',', ''))),
                                style: myTextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black),
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                size: 22,
                              )
                            ],
                          )
                        : // Skeleton effect if data is loading
                        Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 200,
                              height: 40,
                              color: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.trending_up),
                          SizedBox(
                            width: 5,
                          ),
                          userData.isNotEmpty
                              ? Text(
                                  'Rp. 0',
                                  style: myTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : // Skeleton effect if data is loading
                              Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 100,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ),
                        ],
                      ),
                      Text(
                        'Imbal Hasil',
                        style: myTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userData.isNotEmpty
                          ? Text(
                              'Rp. 0',
                              style: myTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : // Skeleton effect if data is loading
                          Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                width: 100,
                                height: 20,
                                color: Colors.white,
                              ),
                            ),
                      Text(
                        'Keuntungan',
                        style: myTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
