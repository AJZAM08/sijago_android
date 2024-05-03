import 'package:flutter/material.dart';

class SelectableBox extends StatefulWidget {
  final List<String> boxTextList;

  const SelectableBox({Key? key, required this.boxTextList}) : super(key: key);

  @override
  _SelectableBoxState createState() => _SelectableBoxState();
}

class _SelectableBoxState extends State<SelectableBox> {
  int _selectedBox = -1; // Indeks kotak yang dipilih

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          3,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                _selectedBox = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 350.0, // Lebar kotak
              height: _selectedBox == index ? 80.0 : 70.0, // Tinggi kotak
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: _selectedBox == index
                    ? Border(
                        bottom: BorderSide(
                          color: const Color.fromARGB(255, 147, 147, 147),
                          width: 2.0,
                        ),
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  widget.boxTextList[
                      index], // Menggunakan teks dari daftar yang sesuai dengan indeks kotak
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              transform: Matrix4.translationValues(
                _selectedBox == index ? 5 : -2.0,
                0,
                0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
