import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';
import 'artikel_list.dart';

class ArtikelView extends StatelessWidget {
  const ArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: fullHeight - fullHeight * 60 / 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color.fromARGB(124, 242, 242, 242)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Artikel',
              style: myTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ArtikelList(judul: 'KERJASAMA PNM investment Management bersama Universitas Bina Nusantara Bekasi', gambar: Assets.image.news1,),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ArtikelList(
                    judul: 'Dana Asing Masuk, Reksadana Indeks Infobank Bersinar', gambar: Assets.image.news2,),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ArtikelList(judul: 'Cetak Cuan 9,46%, PNM SBN Terbaik Sepanjang Tahun Lalu', gambar: Assets.image.news3,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
