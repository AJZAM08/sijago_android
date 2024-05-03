import 'dart:ui';

bool checkNikField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text.startsWith('32');
}

bool checkNamaField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text != "nama" || text != "nema" 
  || text != "name"
  || text != "kp"
  || !(text.startsWith('provinsi')) 
  || !(text.startsWith('tempat'))
  || !(text.startsWith('alamat'))
  || !(text.startsWith('jenis'))
  || !(text.startsWith('rt/rw'))
  || !(text.startsWith('kelurahan'))
  || !(text.startsWith('desa'))
  || !(text.startsWith('kabupaten'))
  || !(text.startsWith('agama'))
  || !(text.startsWith('1slam'))
  || !(text.startsWith('kawin'))
  || !(text.startsWith('pelajar'))
  || !(text.startsWith('wni'))
  || !(text.startsWith('kel/desa'))
  || !(text.startsWith('kecamatan'))
  || !(text.startsWith('kp'))
  || !(text.contains('/'))
  || !(text.contains(':'))
  || !(text.contains('kp'))
  || !(text.contains('.'))
  || !(text.contains('kecamatan'))
  || !(text.contains('gol'))
  || !(text.startsWith('32'))
  || !(text.startsWith('pekerjaan'));
}

bool checkTglLahirField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "lahir" ||
      text == "tempat" ||
      text == "tempatigllahir" ||
      text == "empatgllahir" ||
      text == "tempat/tgl";
}

bool checkJenisKelaminField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "lakilaki" || text == "perempuan" || text == "laki-laki"|| text == ":akilaki";
}

bool checkAlamatField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "alamat" ||
      text == "lamat" ||
      text == "alaahom" ||
      text == "alama" ||
      text == "alamao" ||
      text == "alamarw";
}

bool checkRtRwField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "rt/rw" || text == "rw " || text == "rt" || text == "rtirw";
}

bool checkKelDesaField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kel/desa" || text == "helldesa" || text == "kelldesa";
}

bool checkKecamatanField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kecamatan" || dataText.contains("kecamatan");
}

bool checkAgamaField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "islam" || text == "1slam" || text == "slam" || text == "kristen";
}

bool checkKawinField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "kawin" || text == "belumkawin" || text == "belum kawin";
}

bool checkPekerjaanField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "pelajarmahasiswa" || text == "mahas1swa" || text == "mahasiswa";
}

bool checkKewarganegaraanField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "wni" ||
      text == "wn1" ||
      text == "wn" ||
      text == "ni";
}

bool isInside(Rect? rect, Rect? isInside) {
  if (rect == null) {
    return false;
  }

  if (isInside == null) {
    return false;
  }

  if (rect.center.dy <= isInside.bottom &&
      rect.center.dy >= isInside.top &&
      rect.center.dy >= isInside.right &&
      rect.center.dx <= 390) {
    return true;
  }
  return false;
}

bool isInside3rect({Rect? isThisRect, Rect? isInside, Rect? andAbove}) {
  if (isThisRect == null) {
    return false;
  }

  if (isInside == null) {
    return false;
  }
  if (andAbove == null) {
    return false;
  }

  if (isThisRect.center.dy <= andAbove.top &&
      isThisRect.center.dy >= isInside.top &&
      isThisRect.center.dx >= isInside.left) {
    return true;
  }
  return false;
}
