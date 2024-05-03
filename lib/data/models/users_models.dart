class UserModel {
  int id;
  String username;
  String email;
  String phoneNumber;
  String password;
  String referralCode;
  bool isVerified;
  String? nik;
  String? nama;
  String? tempatLahir;
  DateTime? tanggalLahir;
  String? jenisKelamin;
  String? alamat;
  String? rt;
  String? rw;
  String? kelurahan;
  String? kecamatan;
  String? kabupatenKota;
  String? provinsi;
  String? kodePos;
  String? agama;
  String? statusPerkawinan;
  String? fotoKTP;
  String? fotoSelfie;
  String? fotoNPWP;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.referralCode,
    required this.isVerified,
    this.nik,
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenisKelamin,
    this.alamat,
    this.rt,
    this.rw,
    this.kelurahan,
    this.kecamatan,
    this.kabupatenKota,
    this.provinsi,
    this.kodePos,
    this.agama,
    this.statusPerkawinan,
    this.fotoKTP,
    this.fotoSelfie,
    this.fotoNPWP,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'referralCode': referralCode,
      'isVerified': isVerified ? 1 : 0,
      'nik': nik,
      'nama': nama,
      'tempatLahir': tempatLahir,
      'tanggalLahir': tanggalLahir?.toIso8601String(),
      'jenisKelamin': jenisKelamin,
      'alamat': alamat,
      'rt': rt,
      'rw': rw,
      'kelurahan': kelurahan,
      'kecamatan': kecamatan,
      'kabupatenKota': kabupatenKota,
      'provinsi': provinsi,
      'kodePos': kodePos,
      'agama': agama,
      'statusPerkawinan': statusPerkawinan,
      'fotoKTP': fotoKTP,
      'fotoSelfie': fotoSelfie,
      'fotoNPWP': fotoNPWP,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      password: map['password'],
      referralCode: map['referralCode'],
      isVerified: map['isVerified'] == 1,
      nik: map['nik'],
      nama: map['nama'],
      tempatLahir: map['tempatLahir'],
      tanggalLahir: map['tanggalLahir'] != null
          ? DateTime.parse(map['tanggalLahir'])
          : null,
      jenisKelamin: map['jenisKelamin'],
      alamat: map['alamat'],
      rt: map['rt'],
      rw: map['rw'],
      kelurahan: map['kelurahan'],
      kecamatan: map['kecamatan'],
      kabupatenKota: map['kabupatenKota'],
      provinsi: map['provinsi'],
      kodePos: map['kodePos'],
      agama: map['agama'],
      statusPerkawinan: map['statusPerkawinan'],
      fotoKTP: map['fotoKTP'],
      fotoSelfie: map['fotoSelfie'],
      fotoNPWP: map['fotoNPWP'],
    );
  }
}
