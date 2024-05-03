import 'package:flutter/material.dart';

class ProductData {
  String? tanggal;
  var harga;
  var perubahanHarian;

  ProductData({
    required this.tanggal,
    required this.harga,
    required this.perubahanHarian,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      tanggal: json['Tanggal'] as String?,
      harga: json['Harga'],
      perubahanHarian: json['Perubahan Harian'],
    );
  }
}

class Product {
  String name;
  String description;
  List<ProductData>? productData;
  IconData? icon;
  String bankKustodi;
  String bankPenampung;

  Product({
    required this.name,
    required this.description,
    this.productData,
    required this.bankKustodi,
    required this.bankPenampung,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['Fund Name'] as String,
      description: json['Deskripsi'],
      bankKustodi: json['Bank Kustodi'],
      bankPenampung: json['Bank Kustodi'],
      productData: [],
    );
  }
}
