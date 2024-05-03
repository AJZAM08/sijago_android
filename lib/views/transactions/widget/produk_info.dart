import 'package:flutter/material.dart';

import '../../../../core/constant/textsytle.dart';
import '../../../core/constant/colors.dart';
import '../../../data/controllers/transaction_controller.dart';

class ProdukInfo extends StatelessWidget {
  final Transaction transactions;
  const ProdukInfo({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
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
            Container(
              height: 53,
              width: 350,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 105, 188, 255),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions.productName!,
                              style: myTextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(223, 236, 244, 0.612),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      child: Row(
                        children: [
                          Text(
                            'No Order:  ',
                            style: myTextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 10, 10, 10),
                            ),
                          ),
                          Text(
                            'TRX128127329139',
                            style: myTextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 89, 89, 89),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Container(
                width: 350,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tipe',
                                style: myTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(232, 42, 42, 42),
                                ),
                              ),
                              Text(
                                transactions.jenisTransaksi!,
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(232, 85, 85, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  width: 200,
                                  child: Text(
                                    'Harga/unit (3 Desember 2022)',
                                    style: myTextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromARGB(232, 42, 42, 42),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Rp. 1.530,06',
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(232, 85, 85, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jumlah Unit',
                                style: myTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(232, 42, 42, 42),
                                ),
                              ),
                              Text(
                                '65.356',
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(232, 85, 85, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nilai Transaksi',
                                style: myTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(232, 42, 42, 42),
                                ),
                              ),
                              Text(
                                transactions.nominalTransaksi!,
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(232, 85, 85, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biaya Pembelian',
                                style: myTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(232, 42, 42, 42),
                                ),
                              ),
                              Text(
                                '0',
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(232, 85, 85, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Metode Pembelian',
                                style: myTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(232, 42, 42, 42),
                                ),
                              ),
                              Text(
                                transactions.paymentMethod!,
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(232, 85, 85, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: myTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(232, 42, 42, 42),
                                ),
                              ),
                              Text(
                                transactions.status!,
                                style: myTextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: transactions.status == 'Berhasil'
                              ? Color.fromRGBO(25, 165, 53, 0.612) : transactions.status == 'Menunggu Pembayaran' ? AppColors.orange : AppColors.red,
                                ),
                              ),
                            ],
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
    );
  }
}
