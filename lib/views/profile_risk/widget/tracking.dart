import 'package:flutter/material.dart';
import 'package:sijago_android/core/constant/colors.dart';
import 'package:sijago_android/data/controllers/transaction_controller.dart';

import '../../../../core/constant/textsytle.dart';

class Tracking extends StatelessWidget {
  final Transaction transactions;
  const Tracking({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              'Status Transaksi',
                              style: myTextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(228, 71, 71, 71)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time_filled_sharp,
                              color: transactions.status == 'Berhasil'
                              ? Color.fromRGBO(25, 165, 53, 0.612) : transactions.status == 'Menunggu Pembayaran' ? AppColors.orange : AppColors.red,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Menunggu Pembayaran',
                                  style: myTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(25, 165, 53, 0.612),
                                  ),
                                ),
                                Text(
                                  transactions.timestamp.toString(),
                                  style: myTextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(69, 69, 69, 0.521),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_downward_rounded,
                            color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time_filled_sharp,
                              color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pesanan Diterima',
                                  style: myTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                                  ),
                                ),
                                Text(
                                  transactions.timestamp.toString(),
                                  style: myTextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(69, 69, 69, 0.521),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_downward_rounded,
                            color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time_filled_sharp,
                              color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pesanan Diproses',
                                  style: myTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                                  ),
                                ),
                                Text(
                                  transactions.timestamp.toString(),
                                  style: myTextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromRGBO(69, 69, 69, 0.521),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_downward_rounded,
                            color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.access_time_filled_sharp,
                              color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pesanan Selesai',
                                  style: myTextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: transactions.status == 'Berhasil' ?
                            Color.fromRGBO(25, 165, 53, 0.612) : Color.fromRGBO(69, 69, 69, 0.521),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
