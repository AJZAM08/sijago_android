import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sijago_android/data/models/product_model.dart';

class ProductController extends GetxController {
  var isFetch = false.obs;
  var searchResults = <Product>[].obs;
  var isLoading = true.obs;
  var productController = TextEditingController().obs;
  var data = <Map<String, dynamic>>[].obs;
  RxList<ProductData> productDataList = RxList();
  RxList<Product> allProduct = RxList();

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          'https://script.google.com/macros/s/AKfycbzO0_91DiOx5DMv8LsBBL_eET8AnRzd1Uhj2n1yRFaLrr0uDeUwxa7THkL1WgrCX2G7Xw/exec'));
      if (response.statusCode == 200) {
        
        var jsonData = jsonDecode(response.body) as List<dynamic>;
        data.assignAll(jsonData.cast<Map<String, dynamic>>());
        for (var i = 0; i < data.length; i++) {
          if (i == 0) {
            allProduct.value = (data[0]['Data'] as List)
                .map((data) => Product.fromJson(data))
                .toList();
          } else {
            productDataList.value = (data[i]['Data'] as List)
                .map((data) => ProductData.fromJson(data))
                .toList();
            for (var element in productDataList) {
              var date = DateTime.parse(element.tanggal ?? '');
              date = date.add(Duration(days: 1));
              element.tanggal = DateFormat.yMMMd('id_ID').format(date);
              element.harga = double.tryParse(NumberFormat('#,##0.00', 'id_ID')
                  .format(element.harga ?? 0.0)
                  .replaceAll(RegExp(r'[^0-9.]'), ''));
              element.perubahanHarian = double.parse(
                  NumberFormat('#,##0.00', 'id_ID')
                      .format(element.perubahanHarian ?? 0.0)
                      .replaceAll(",", "."));
            }
            allProduct[i - 1].productData!.addAll(productDataList);
            isFetch.value = true;
          }
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      results = allProduct;
    } else {
      results = allProduct
          .where((product) =>
              product.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    searchResults.value = results;
  }
}
