import 'package:flutter/material.dart';

class FormUbah extends StatelessWidget {
  final List<String> labelTexts;
  final List<String> hintTexts;
  final List<TextEditingController> controllers;

  const FormUbah({
    Key? key,
    required this.labelTexts,
    required this.hintTexts,
    required this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 11, // Ubah menjadi 11
      itemBuilder: (context, index) {
        // Pastikan index tidak melebihi panjang list
        if (index >= labelTexts.length ||
            index >= hintTexts.length ||
            index >= controllers.length) {
          return SizedBox
              .shrink(); // Jika index melebihi panjang list, kembalikan widget kosong
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              labelTexts[index],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 146, 146, 146)),
            ),
            SizedBox(height: 10),
            Container(
              width: 347,
              height: 50,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(238, 240, 244, 100)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(
                    hintText: hintTexts[index],
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
