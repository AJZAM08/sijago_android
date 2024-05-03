// lib/widgets/product_list.dart
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/portofilio_controller.dart';
import '../../portofolio/widget/tombol_portofolio.dart';

class PortofolioList extends StatelessWidget {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    productController.filterProducts('All');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text('All'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    productController.filterProducts('Pendapatan');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text('Pendapatan Tetap'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    productController.filterProducts('Pasar Uang');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text('Pasar Uang'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    productController.filterProducts('Campuran');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    child: Text('Campuran'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Obx(
                () =>
                  productController.filteredProducts.isNotEmpty ? 
                  ListView.builder(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          productController.filteredProducts[index].name!,
                                          style: myTextStyle(
                                              fontSize: productController.filteredProducts[index].name!.length > 22 ? 15 : 17,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          productController.filteredProducts[index].description!,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  'Rp. ${productController.filteredProducts[index].imbal_hasil!} (0.0 %)',
                                  style: myTextStyle(
                                    color: Colors.green,
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
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: 200,
                                    child: TombolPortofolio(
                                      label: 'Beli lagi',
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
                ) : Center(
                  child: Text('Belum ada Produk yang dibeli'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
