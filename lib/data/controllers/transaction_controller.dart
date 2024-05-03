import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sijago_android/core/assets/assets_gen.dart';
import 'package:sijago_android/core/components/custom_snackbar.dart';
import 'package:sijago_android/core/constant/colors.dart';
// import 'package:sijago_android/core/assets/assets_gen.dart';
// import 'package:sijago_android/core/components/custom_snackbar.dart';
// import 'package:sijago_android/core/constant/colors.dart';
import 'package:sijago_android/data/controllers/auth_controller.dart';
import 'package:sijago_android/data/controllers/product_controller.dart';

class TransactionsController extends GetxController {
  var userCtrl = Get.find<AuthController>();
  var ctrl = Get.find<ProductController>();
  RxList<Transaction> userData = RxList();
  RxList<UserProduct> userProduct = RxList();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxString docId = ''.obs;
  RxString nameProduct = ''.obs;
  RxString nominalProduct = ''.obs;
  RxInt index = 0.obs;

  Future<void> addProductTransaction(String productName, String jenisTransaksi,
      String nominal, String payment, String status) async {
    DocumentReference docRef = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.email)
        .collection('transactions')
        .add({
      'product name': productName,
      'timestamp': DateTime.now(),
      'jenis transaksi': jenisTransaksi,
      'nominal transaksi': nominal,
      'status': status,
      'payment method': payment,
    });
    docId.value = docRef.id;
    nameProduct.value = productName;
    nominalProduct.value = nominal;
  }

  Future<void> updateProductTransaction(String status) async {
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.email)
        .collection('transactions')
        .doc(docId.value)
        .update({
      'timestamp': DateTime.now(),
      'status': status,
    });

    if (status == 'Berhasil') {
      var foundProduct = ctrl.allProduct.firstWhere(
        (product) => product.name == nameProduct.value,
      );
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.email)
          .collection('products')
          .add({
        'name': nameProduct.value,
        'description': foundProduct.description,
        'imbal_hasil': 0,
        'harga': foundProduct.productData!.last.harga,
        'tanggal':foundProduct.productData!.last.tanggal,
        'nominal':nominalProduct.value
      });
      snackBar('Berhasil', 'pembelian produk berhasil', AppColors.green, Assets.icon.check);
    }else {
      snackBar('Gagal', 'pembelian produk gagal', AppColors.red, Assets.icon.alert);
    }
  }

  void fetchPembelianData(String email) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("transactions")
        .snapshots()
        .listen((querySnapshot) {
      List<Transaction> transactions = [];
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          var data = doc.data();
          Transaction transaction = Transaction.fromJson(data);
          transactions.add(transaction);
        } else {
          print("Document does not exist");
        }
      });
      userData.addAll(transactions);
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(email)
        .collection("products")
        .snapshots()
        .listen((querySnapshot) {
      List<UserProduct> product= [];
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          var data = doc.data();
          UserProduct products = UserProduct.fromJson(data);
          product.add(products);
        } else {
          print("Document does not exist");
        }
      });
      userProduct.addAll(product);
    });
  }

  @override
  void onInit() {
    super.onInit();
    if (_auth.currentUser != null) {
      fetchPembelianData(_auth.currentUser!.email!);
    }
  }
}

class UserProduct {
  String? name;
  String? description;
  dynamic imbal_hasil;
  dynamic harga;
  String? tanggal;
  dynamic nominal;

  UserProduct({
    this.name,
    this.description,
    this.imbal_hasil,
    this.harga,
    this.tanggal,
    this.nominal
  });

  factory UserProduct.fromJson(Map<String, dynamic> json) {
    return UserProduct(
      name: json['name'],
      description: json['description'],
      imbal_hasil: json['imbal_hasil'],
      harga: json['harga'],
      tanggal: json['tanggal'],
      nominal: json['nominal'],
    );
  }
}

class Transaction {
  String? productName;
  DateTime? timestamp;
  String? jenisTransaksi;
  String? nominalTransaksi;
  String? status;
  String? paymentMethod;

  Transaction({
    this.productName,
    this.timestamp,
    this.jenisTransaksi,
    this.nominalTransaksi,
    this.status,
    this.paymentMethod,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      productName: json['product name'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      jenisTransaksi: json['jenis transaksi'],
      nominalTransaksi: json['nominal transaksi'],
      status: json['status'],
      paymentMethod: json['payment method'],
    );
  }
}
