import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sijago_android/data/controllers/data_controller.dart';

import 'detector.dart';

// Consider using a state management solution like Provider or Bloc for better handling of results
class TextRecognizerController extends GetxController {
  var controller = Get.find<UserData>();
  var nikRx = ''.obs;
  var namaRx = ''.obs;
  var dobRx = ''.obs;
  var pobRx = ''.obs;
  var addressRx = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final RxString hasil = RxString('');
  final RxString coba = RxString('');
  var list = [].obs;
  var temp = [].obs;

  void clear() {
    list.clear();
  }

  Future<void> pickImages(String path) async {
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // if (image == null) {
    //   print("Tidak ada gambar yang dipilih.");
    //   return;
    // }
    final File imageFile = File(path);
    try {
      final inputImage = InputImage.fromFilePath(imageFile.path);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      hasil.value = recognizedText.text;

      for (TextBlock textBlock in recognizedText.blocks) {
        for (TextLine line in textBlock.lines) {
          try {
            list.add(line.text);
          } catch (e) {
            print('error njir ${e}');
          }
        }
      }
      print(list);
    } catch (error) {
      print("Error processing image: $error");
    }

    try {
      for (int i = 0; i < list.length; i++) {
        if (checkNikField(list[i])) {
          print("nik field detected");
          print(list[i]);
          controller.nikTeks.value = list[i];
        }

        if (checkNamaField(list[i])) {
          print("nama field detected");
          print(list[15]);
        }

        if (checkTglLahirField(list[i])) {
          print("tempat tgllahir field detected");
          print(list[i]);
        }

        if (checkJenisKelaminField(list[i])) {
          print("jenis kelamin field detected");
          print(list[i]);
        }

        if (checkAlamatField(list[i])) {
          print("alamat field detected");
          print(list[i]);
        }

        if (checkRtRwField(list[i])) {
          print("RT/RW field detected");
          print(list[i]);
        }

        if (checkKelDesaField(list[i])) {
          print("kelurahan / desa field detected");
          print(list[i]);
        }

        if (checkKecamatanField(list[i])) {
          print("kecamatan field detected");
          print(list[i]);
        }

        if (checkAgamaField(list[i])) {
          print("agama field detected");
          print(list[i]);
        }

        if (checkKawinField(list[i])) {
          print("statusKawin field detected");
          print(list[i]);
        }

        if (checkPekerjaanField(list[i])) {
          print("pekerjaan field detected");
          print(list[i]);
        }

        if (checkKewarganegaraanField(list[i])) {
          print("kewarganegaraan field detected");
          print(list[i]);
        }
      }
    } catch (e) {
      print('eyoy');
    }
  }

  Future<void> cobian(String path) async {
    String nikResult = "";
    String nameResult = "";
    String tempatLahirResult = "";
    String tglLahirResult = "";
    String jenisKelaminResult = "";
    String alamatFullResult = "";
    String alamatResult = "";
    String rtrwResult = "";
    String kelDesaResult = "";
    String kecamatanResult = "";
    String agamaResult = "";
    String statusKawinResult = "";
    String pekerjaanResult = "";
    String kewarganegaraanResult = "";

    Rect? nikRect;
    Rect? namaRect;
    Rect? alamatRect;
    Rect? rtrwRect;
    Rect? kelDesaRect;
    Rect? kecamatanRect;
    Rect? jenisKelaminRect;
    Rect? tempatTanggalLahirRect;
    Rect? agamaRect;
    Rect? statusKawinRect;
    Rect? pekerjaanRect;
    Rect? kewarganegaraanRect;

    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // if (image == null) {
    //   print("Tidak ada gambar yang dipilih.");
    //   return;
    // }
    final File imageFile = File(path);
    print("YEEEEEEEE");

    final inputImage = InputImage.fromFilePath(imageFile.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    try {
      for (int i = 0; i < recognizedText.blocks.length; i++) {
        for (int j = 0; j < recognizedText.blocks[i].lines.length; j++) {
          for (int k = 0;
              k < recognizedText.blocks[i].lines[j].elements.length;
              k++) {
            final data = recognizedText.blocks[i].lines[j].elements[k];

            print("b$i l$j e$k " +
                data.text.toLowerCase().trim().replaceAll(" ", "") +
                " " +
                data.boundingBox.center.toString());

            if (checkNikField(data.text)) {
              nikRect = data.boundingBox;
              print("nik field detected");
            }

            if (checkNamaField(data.text)) {
              namaRect = data.boundingBox;
              print("nama field detected");
            }

            if (checkTglLahirField(data.text)) {
              tempatTanggalLahirRect = data.boundingBox;
              print("tempat tgllahir field detected");
            }

            if (checkJenisKelaminField(data.text)) {
              jenisKelaminRect = data.boundingBox;
              print("jenis kelamin field detected");
            }

            if (checkAlamatField(data.text)) {
              alamatRect = data.boundingBox;
              print("alamat field detected");
            }

            if (checkRtRwField(data.text)) {
              rtrwRect = data.boundingBox;
              print("RT/RW field detected");
            }

            if (checkKelDesaField(data.text)) {
              kelDesaRect = data.boundingBox;
              print("kelurahan / desa field detected");
            }

            if (checkKecamatanField(data.text)) {
              kecamatanRect = data.boundingBox;
              print("kecamatan field detected");
            }

            if (checkAgamaField(data.text)) {
              agamaRect = data.boundingBox;
              print("agama field detected");
            }

            if (checkKawinField(data.text)) {
              statusKawinRect = data.boundingBox;
              print("statusKawin field detected");
            }

            if (checkPekerjaanField(data.text)) {
              pekerjaanRect = data.boundingBox;
              print("pekerjaan field detected");
            }

            if (checkKewarganegaraanField(data.text)) {
              kewarganegaraanRect = data.boundingBox;
              print("kewarganegaraan field detected");
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }

    try {
      for (int i = 0; i < recognizedText.blocks.length; i++) {
        for (int j = 0; j < recognizedText.blocks[i].lines.length; j++) {
          final data = recognizedText.blocks[i].lines[j];

          if (isInside(data.boundingBox, nikRect)) {
            nikResult = data.text;
            print("------ nik");
            print(nikResult);
            controller.nikTeks.value = nikResult;
          }

          if (isInside3rect(
              isThisRect: data.boundingBox,
              isInside: namaRect,
              andAbove: tempatTanggalLahirRect)) {
            if (data.text.toLowerCase() != "nama") {
              print("------ name");
              nameResult = (nameResult + " " + data.text).trim();
              print(nameResult);
              controller.namaTeks.value = nameResult;
            }
          }

          if (isInside(data.boundingBox, tempatTanggalLahirRect)) {
            final temp = data.text.replaceAll("Tempat/Tgi Lahir", "");
            tempatLahirResult = temp.substring(0, temp.indexOf(',') + 1);
            print("------ tempat lahir");
            print(tempatLahirResult);
          }

          if (isInside(data.boundingBox, tempatTanggalLahirRect)) {
            final temp = data.text.replaceAll("Tempat/Tgl Lahir", "");
            final result = temp.substring(0, temp.indexOf(',') + 1);
            print(result);
            if (result.isNotEmpty) {
              tglLahirResult =
                  temp.replaceAll(result, "").replaceAll(":", "").trim();
            }

            print("------ tgllahir");
            print(tglLahirResult);
          }

          if (isInside(data.boundingBox, jenisKelaminRect)) {
            jenisKelaminResult = jenisKelaminResult + " " + data.text;
            print("------ jenis kelamin ");
            print(rtrwResult);
          }
        }
      }
      print('BISA COKKK');
    } catch (e) {
      print(e);
      print('GAK BISAA COKKK');
    }
  }
}
