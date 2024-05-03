import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DropdownController extends GetxController {
  var _selectedItem = 'Item 1'.obs;
  RxString? selectedJenisKelamin;
  RxString? selectedStatus;
  RxString? selectedAgama;
  String get selectedItem => _selectedItem.value;
  var data = <Map<String, dynamic>>[].obs;
  List<Region> provinsiList = [];
  RxList<Kabupaten> kabupatenList = RxList();

  var selectedProvinsi = Rxn<Region>();
  var selectedKabupatenKota = Rxn<Kabupaten>();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          'https://script.google.com/macros/s/AKfycbzN706c_dycIsHX1ey3eHfU_goksKHD4ipQoDNEF_rPjyMY72RvomB_5AYohDedA10r/exec'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;

        if (jsonData.isNotEmpty) {
          provinsiList = (jsonData[0]['Data'] as List)
              .map((data) => Region.fromJson(data))
              .toList();
          kabupatenList.assignAll(
              (provinsiList.isNotEmpty && provinsiList.first.kabupaten != null)
                  ? provinsiList.first.kabupaten!
                  : []);
          for (var i = 1; i < jsonData.length; i++) {
            var kabupatens = (jsonData[i]['Data'] as List)
                .map((data) => Kabupaten.fromJson(data))
                .toList();
            provinsiList[i - 1].kabupaten = kabupatens;
          }
          print(provinsiList[0].kabupaten![0].kabupatenkota);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void selectProvinsi(Region? region) {
    selectedProvinsi.value = region;
    kabupatenList.assignAll(region?.kabupaten ?? []);
    selectedKabupatenKota.value =
        null; // Reset kabupaten/kota saat provinsi berubah
  }

  void selectKabupaten(String? kabupatenName) {
    if (kabupatenName != null && selectedProvinsi.value != null) {
      var kabupaten = selectedProvinsi.value!.kabupaten?.firstWhere(
        (kab) => kab.kabupatenkota == kabupatenName,
        orElse: () => Kabupaten(kabupatenkota: null),
      );

      if (kabupaten != null) {
        selectedKabupatenKota.value = kabupaten;
      }
    }
  }
}

class Region {
  String provinsi;
  List<Kabupaten>? kabupaten;

  Region({
    required this.provinsi,
    this.kabupaten,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      provinsi: json['Provinsi'] as String,
      kabupaten: [],
    );
  }
}

class Kabupaten {
  String? kabupatenkota;

  Kabupaten({
    required this.kabupatenkota,
  });

  factory Kabupaten.fromJson(Map<String, dynamic> json) {
    return Kabupaten(
      kabupatenkota: json['Kabupaten/Kota'] as String?,
    );
  }
}
