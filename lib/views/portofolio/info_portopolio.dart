// lib/widgets/product_list.dart
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/size.dart';
import '../../core/constant/textsytle.dart';
import '../../data/controllers/portofilio_controller.dart';
import 'widget/tombol_portofolio.dart';

class InfoPortopolio extends StatelessWidget {
  final PortofolioController productController =
      Get.put<PortofolioController>(PortofolioController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: SizedBox(
        height: fullHeight - fullHeight * 42 / 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: productController.filteredProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 7),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  color: Colors.grey.withOpacity(.2)),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      productController
                                          .filteredProducts[index].name!,
                                      style: myTextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          productController
                                              .filteredProducts[index]
                                              .description!,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        Text(
                                          'Rp 0,96(+0,003%)',
                                          style: myTextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('data'),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('data'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('data'),
                                      Text('data'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: 200,
                                    child: TombolPortofolio(
                                      label: 'Beli Lagi',
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 57,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 163, 197, 255),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: RotatedBox(
                                      quarterTurns:
                                          1, // Putar 90 derajat searah jarum jam
                                      child: Icon(Icons.more_vert),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // paddingOnly(bottom: 20),
          ],
        ),
      ),
    );
  }
}
