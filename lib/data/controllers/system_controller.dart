import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:sijago_android/ai/controller.dart';

import '../routes/route_name.dart';
import 'auth_controller.dart';

class SystemController extends GetxController {
  var controller = Get.find<TextRecognizerController>();
  var userCtrl = Get.find<AuthController>();
  late final Future<void> future;
  var isPermissionGranted = false.obs;
  var imagePathKTP = ''.obs;
  var imagePathSelfie = ''.obs;
  var imagePathNPWP = ''.obs;
  CameraController? cameraController;
  final xFileProvider = <XFile>(ref) => ''.obs;
  RxString scanText = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final RxString _selectedImagePath = ''.obs;
  String get selectedImagePath => _selectedImagePath.value;


  void coba() async {
    try {
      await controller.pickImages(imagePathKTP.value);
      Get.toNamed(RouteName.ktpDetails);
      print('bisaaa');
    } catch (e) {
      print('njirrrrrrr');
    }
  }

  void setImage(File? image) {
    imagePathSelfie.value = image!.path;
  }

  Widget message(String msg) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
    child: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
    ),
  );


  @override
  void onInit() {
    super.onInit();

    future = _requestCameraPermission();
  }

  

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    isPermissionGranted.value = status == PermissionStatus.granted;
  }

  Future<void> initializationCamera(int index) async {
    var cameras = await availableCameras();
    cameraController = CameraController(cameras[index], ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.yuv420, enableAudio: false);
    await cameraController!.initialize();
    cameraController!.setFlashMode(FlashMode.off);
    cameraController!.setFocusMode(FocusMode.auto);
  }

  Future<void> onTakePicture(RxString imagePath, String route) async {
    final pictureFile = await cameraController!.takePicture();
    imagePath.value = pictureFile.path;
    if (userCtrl.userCredential != null &&
        userCtrl.userCredential!.user != null) {
      await uploadImageToFirebase(imagePath.value);
    } else {
      print("User is not signed in");
    }
    Get.toNamed(route);
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImagePath.value = pickedFile.path;
    } else {
      // Pengguna membatalkan pemilihan gambar dari galeri
    }
  }

  Future<void> uploadImageToFirebase(String imagePath) async {
    try {
      final file = File(imagePath);
      if (!file.existsSync()) {
        throw Exception("File not found");
      }

      String fileName = Path.basename(file.path);
      firebase_storage.UploadTask task = firebase_storage
          .FirebaseStorage.instance
          .ref('images/$fileName')
          .putFile(file);

      await task.whenComplete(() async {
        String downloadURL = await task.snapshot.ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCtrl.userCredential!.user!.email)
            .update({'profileRef': downloadURL});

        print("Image uploaded to Firebase Storage. Download URL: $downloadURL");
      });
    } catch (e) {
      print("Error uploading image to Firebase Storage: $e");
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}

enum EnumCameraDescription { back, front }
