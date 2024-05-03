import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/components/custom_button.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/components/custom_appbar.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../data/controllers/system_controller.dart';
import '../../../../data/routes/route_name.dart';
import '../../widget/header_kyc.dart';

class TakeNPWP extends StatelessWidget {
  const TakeNPWP({super.key});

  @override
  Widget build(BuildContext context) {
    var cameraCtrl = Get.find<SystemController>();
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 25,
            color: AppColors.primary,
          ),
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
      body: Container(
        width: fullWidth,
        height: fullHeight,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: HeaderKyc(title: 'Upload Foto NPWP'),
                  ),
                  FutureBuilder(
                    future: cameraCtrl.initializationCamera(0),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: AspectRatio(
                                aspectRatio: 2 / 3,
                                child:
                                    CameraPreview(cameraCtrl.cameraController!),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: AspectRatio(
                                aspectRatio: 2 / 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        Assets.image.ktpFrame,
                                      ),
                                      fit: BoxFit.fill
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox(
                          height: 500,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MyButton(
                label: 'Ambil Gambar',
                onPressed: () {
                  cameraCtrl.onTakePicture(cameraCtrl.imagePathNPWP, RouteName.npwpResult);
                },
                textGesture2: 'Pilih dari Galeri',
                onPressGesture: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
