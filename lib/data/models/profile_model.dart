class UserProfileModel {
  final int id;
  final int userId;
  final String nik;
  final String fullName;
  final String birthDate;
  final String birthPlace;
  final String gender;
  final String rt;
  final String rw;
  final String address;
  final String subDistrict;
  final String district;
  final String city;
  final String province;
  final String postalCode;
  final String religion;
  final String maritalStatus;

  UserProfileModel({
    required this.id,
    required this.userId,
    required this.nik,
    required this.fullName,
    required this.birthDate,
    required this.birthPlace,
    required this.gender,
    required this.rt,
    required this.rw,
    required this.address,
    required this.subDistrict,
    required this.district,
    required this.city,
    required this.province,
    required this.postalCode,
    required this.religion,
    required this.maritalStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'nik': nik,
      'fullName': fullName,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'gender': gender,
      'rt': rt,
      'rw': rw,
      'address': address,
      'subDistrict': subDistrict,
      'district': district,
      'city' : city,
      'province': province,
      'postalCode': postalCode,
      'religion': religion,
      'maritalStatus': maritalStatus,
    };
  }
}
