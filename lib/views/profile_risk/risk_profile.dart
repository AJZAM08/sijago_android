import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/views/home/pages/dashboard_page.dart';

import '../../../../../../core/components/custom_appbar.dart';
import '../../../core/constant/textsytle.dart';
import 'widget/button_next.dart';

class RiskProfile extends StatelessWidget {
  const RiskProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leading: Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 113, 205),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileInfo(),
              SizedBox(height: 300),
              ButtonNext(label: 'Selanjutnya', onPressed: () {Get.to(() => Dashboard());}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileImage(),
          _buildProfileTitle(),
          _buildProfileSubtitle(),
          _buildProfileDescription(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 118, vertical: 50),
      child: Container(
        child: Icon(
          Icons.photo_size_select_actual_rounded,
          size: 220,
        ),
      ),
    );
  }

  Widget _buildProfileTitle() {
    return Text(
      'Tingkat Profile Risiko Kamu',
      style: myTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 91, 91, 91),
      ),
    );
  }

  Widget _buildProfileSubtitle() {
    return SizedBox(height: 13);
  }

  Widget _buildProfileDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        'Risiko profil anda masih mementingkan pada keutuhan nilai pokok investasi tetapi mulai bersedia menerima fluktuasi nilai investasia dalam jangka pendek untuk mendapatkan hasil yang lebih baik dari deposito berjangka. jenis investasi yang sesuai untuk anda adalah reksa dana pasar uang sebagai instrumen utama dan sebagai pada reksa dana pasar uang sebagai instrumenutama dan sebagian pada reksa dana pendapatan tetap.',
        textAlign: TextAlign.center,
        style: myTextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}
