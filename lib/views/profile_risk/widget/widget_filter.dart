import 'package:flutter/material.dart';

class Product {
  final String merk;
  final String deskripsi;
  final String harga;
  final Color? color;
  final IconData? icon;

  Product({this.icon, this.color, required this.merk, required this.deskripsi, required this.harga,});
}