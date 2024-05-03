import 'package:flutter/material.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/constant/colors.dart';
import '../../core/assets/assets_gen.dart';
import '../../core/constant/textsytle.dart';
import '../profile_risk/widget/button_jual.dart';

class Jual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Nominal Input Form Example',
      home: JualPage(),
    );
  }
}

class JualPage extends StatefulWidget {
  @override
  _JualPageState createState() => _JualPageState();
}

class _JualPageState extends State<JualPage>
    with SingleTickerProviderStateMixin {
  // Controller for the text field
  late AnimationController _controller;
  TextEditingController _nominalController = TextEditingController();
  bool switchValue = false;
  bool isExpanded = false;
  bool isChecked = false;
  Color containerColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // Inisialisasi AnimationController
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Hapus AnimationController saat widget di dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        leading: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 113, 205),
                )),
            Text(
              'Jual Reksadana',
              style: myTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black.withOpacity(.7),
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                child: Image.asset(
                  Assets.logo.logoSijago,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Color.fromARGB(255, 255, 255, 255),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, top: 7),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'PNM Faaza',
                        style: myTextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        'Pasar Uang Syariah',
                        style: myTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
              ),
              Container(
                height: 280,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Informasi Produk',
                        textAlign: TextAlign.center,
                        style: myTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jumlah Unit',
                            textAlign: TextAlign.left,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '65,356',
                            textAlign: TextAlign.end,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
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
                          Text(
                            'Harga/Unit Terakhir',
                            textAlign: TextAlign.left,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rp. 1.200,54',
                            textAlign: TextAlign.end,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '10 Desember 2024',
                                style: myTextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blue.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Unit Yang Dimiliki',
                            textAlign: TextAlign.left,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rp. 100.000,65',
                            textAlign: TextAlign.end,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
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
                          Text(
                            'Minimum Pembelian',
                            textAlign: TextAlign.left,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rp. 100.000',
                            textAlign: TextAlign.end,
                            style: myTextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Biaya Admin',
                                textAlign: TextAlign.left,
                                style: myTextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 208,
                              ),
                              Text(
                                'Rp. 0',
                                textAlign: TextAlign.end,
                                style: myTextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 7),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
              ),
              Container(
                height: 265,
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 7),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Jumlah Penjualan',
                        textAlign: TextAlign.center,
                        style: myTextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Rp.',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _nominalController,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              decoration: InputDecoration(
                                hintText: 'Min 100.000',
                                hintStyle: myTextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10.0,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _nominalController.text = '100.000';
                              });
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: Color.fromARGB(255, 244, 244,
                                  244), // Ubah warna latar belakang tombol
                              elevation: 20, // Tambahkan bayangan pada tombol
                            ),
                            child: Text(
                              '100.000',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0)), // Ubah warna teks tombol
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _nominalController.text = '200.000';
                              });
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: const Color.fromARGB(255, 244,
                                  244, 244), // Ubah warna latar belakang tombol
                              elevation: 20, // Tambahkan bayangan pada tombol
                            ),
                            child: Text(
                              '200.000',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0)), // Ubah warna teks tombol
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _nominalController.text = '500.000';
                              });
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: const Color.fromARGB(255, 244,
                                  244, 244), // Ubah warna latar belakang tombol
                              elevation: 20, // Tambahkan bayangan pada tombol
                            ),
                            child: Text(
                              '500.000',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0)), // Ubah warna teks tombol
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _nominalController.text = '1.000.000';
                              });
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: const Color.fromARGB(255, 244,
                                  244, 244), // Ubah warna latar belakang tombol
                              elevation: 20, // Tambahkan bayangan pada tombol
                            ),
                            child: Text(
                              '1.000.000',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: const Color.fromARGB(
                                      255, 0, 0, 0)), // Ubah warna teks tombol
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 300,
                        height: 60,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10), // Mengatur border radius keseluruhan container
                            color: containerColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Alihkan Semua',
                                style: TextStyle(
                                  color: switchValue
                                      ? Color.fromARGB(255, 230, 230, 230)
                                      : Color.fromARGB(255, 158, 158, 158),
                                  fontSize: 18,
                                ),
                              ),
                              Switch(
                                value: switchValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    switchValue = newValue;
                                    containerColor = switchValue
                                        ? Colors.blue
                                        : Color.fromARGB(255, 244, 244, 244);
                                  });
                                },
                                activeColor:
                                    Colors.white, // Warna saat switch aktif
                                inactiveTrackColor: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255), // Warna track saat switch tidak aktif
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jumlah Unit',
                                  style: myTextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 158, 158, 158),
                                  ),
                                ),
                                Text(
                                  '65.365',
                                  style: myTextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromARGB(187, 33, 149, 243),
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
              Padding(
                padding: const EdgeInsets.only(top: 40),
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 7),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedSize(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: Text(
                                  'Saya menyetujui pembelian reksa dana di halaman ini dan telah membaca dan menyetujui seluruh isi Prospektus dan keterangan ringkas serta memahami risiko atas keputusan investasi yang saya buat. ',
                                  overflow: TextOverflow.fade,
                                  maxLines: isExpanded ? null : 2,
                                  textAlign: TextAlign.justify,
                                  style: myTextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Text(
                                  isExpanded ? 'Tutup' : 'Baca selengkapnya',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Estimasi Pembayaran',
                      style: myTextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.black45,
                      ),
                    ),
                    Text(
                      'Rp. 0',
                      style: myTextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ButtonJual(label: 'Jual', onPressed: () {}),
                  ButtonJual(label: 'Batalkan', onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
