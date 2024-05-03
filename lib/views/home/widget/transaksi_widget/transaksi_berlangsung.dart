import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sijago_android/data/controllers/transaction_controller.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../other/transaksi_list3.dart';

class TransaksiBanner extends StatelessWidget {
  final List<Transaction> transactions;

  const TransaksiBanner({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<TransactionsController>();
    return transactions.isNotEmpty
        ? ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              var formattedTimestamp = DateFormat.yMMMd('id_ID')
                  .add_jm()
                  .format(transactions[index].timestamp!)
                  .toString();
              return InkWell(
                onTap: () {
                  {
                    ctrl.index.value = index;
                    Get.to(() => TransaksiList3(index: index,));
                  }
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        height: fullHeight * .19,
                        decoration: BoxDecoration(
                          color: AppColors.whiteBg,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(.2),
                              offset: Offset(1, 2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      transactions[index].productName!,
                                      style: myTextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    AutoSizeText(
                                      formattedTimestamp,
                                      style: myTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black150,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tipe',
                                  style: myTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black150,
                                  ),
                                ),
                                Text(
                                  transactions[index].jenisTransaksi!,
                                  style: myTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black150,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nilai Transaksi',
                                  style: myTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black150,
                                  ),
                                ),
                                Text(
                                  transactions[index]
                                      .nominalTransaksi
                                      .toString(),
                                  style: myTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black150,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: myTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black150,
                                  ),
                                ),
                                Text(
                                  transactions[index].status!,
                                  style: myTextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: transactions[index].status! ==
                                            'Menunggu Pembayaran'
                                        ? const Color.fromARGB(255, 2, 145, 255)
                                        : transactions[index].status! ==
                                                'Pembayaran Berhasil'
                                            ? AppColors.green
                                            : transactions[index].status! ==
                                                    'Pembayaran Gagal'
                                                ? AppColors.red
                                                : AppColors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    transactions[index] == transactions.last
                        ? SizedBox(
                            height: 80,
                          )
                        : SizedBox()
                  ],
                ),
              );
            },
          )
        : Center(
            child: Text(
              'Belum Ada Transaksi',
              style: myTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
  }
}
