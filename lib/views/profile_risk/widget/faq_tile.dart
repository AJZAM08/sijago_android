import 'package:flutter/material.dart';

import '../../../../core/constant/textsytle.dart';

class FAQBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 40, left: 45, right: 45),
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
        child: FAQList(),
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        FAQTile(
          'Apa Itu Biaya Transaksi?',
          'Biaya Transaksi adalah ...',
        ),
        FAQTile(
          'Apa Itu Biaya Transaksi',
          'Biaya Transaksi adalah ...',
        ),
      ],
    );
  }
}

class FAQTile extends StatefulWidget {
  final String question;
  final String answer;

  FAQTile(this.question, this.answer);

  @override
  _FAQTileState createState() => _FAQTileState();
}

class _FAQTileState extends State<FAQTile> {
  bool isExpanded = false;

  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.question,
        style: TextStyle(fontSize: 16), // Ukuran teks untuk pertanyaan
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.start,
                widget.answer,
                style: myTextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 105, 105, 105),
                    fontWeight: FontWeight.w300), // Ukuran teks untuk jawaban
              ),
            ],
          ),
        ),
      ],
    );
  }
}
