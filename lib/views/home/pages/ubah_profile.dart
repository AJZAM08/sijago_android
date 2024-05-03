import 'package:flutter/material.dart';

import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../core/assets/assets_gen.dart';
import '../../../core/constant/textsytle.dart';
import '../widget/profile_widget/button_ubah.dart';
import '../widget/profile_widget/form_ubah.dart';
import '../widget/profile_widget/list_ubah.dart';
class UbahProfile extends StatelessWidget {
  const UbahProfile({super.key});

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
              'Informasi Akun',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Container(
                height: 900,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormUbah(
                    labelTexts: ['Label', 'Nomor CIF', 'Nomor SID','Nomor KTP', 'Nomor NPWP', 'Tempat Lahir', 'Tanggal Lahir', 'Jenis Kelamin', 'Alamat', 'Alamat Email', 'Nomor Telepon'],
                    hintTexts: [
                      'Masukan Label', 'Masukan Nomor CIF', 'Masukan Nomor SID','Masukan Nomor KTP', 'Masukan Nomor NPWP', 'Masukan Tempat Lahir', 'Masukan Tanggal Lahir', 'Masukan Jenis Kelamin', 'Masukan Alamat', 'Masukan Alamat Email', 'Masukan Nomor Telepon'
                    ],
                    controllers:
                        List.generate(12, (index) => TextEditingController()),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            ButtonUbah(label: 'Simpan Perubahan', onPressed: (){}),
            SizedBox(height: 15,),
            ListUbah(),
            Padding(padding: EdgeInsets.only(bottom: 20))
          ],
        ),
      ),
    );
  }
}
