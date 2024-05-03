class $AssetsOnboardingGen {
  const $AssetsOnboardingGen();

  String get first => 'assets/images/intro1.png';

  String get second => 'assets/images/intro2.png';

  String get third => 'assets/images/intro3.png';

  List<String> get values => [first, second, third];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  String get logoSijago => 'assets/images/logo-sijago.png';

  String get logoPNM => 'assets/images/logo-PNM.svg';

  List<String> get values => [logoSijago, logoPNM];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  String get verify => 'assets/images/done-verify.png';

  String get pin => 'assets/images/pin-done.png';

  String get kyc => 'assets/images/kyc-done.png';

  String get ktp => 'assets/images/ktp.png';

  String get selfie => 'assets/images/selfie.png';

  String get ktpFrame => 'assets/images/ktp-frame.png';

  String get selfieFrame => 'assets/images/selfie-frame.png';

  String get risk => 'assets/images/risk-profil.png';

  String get warning => 'assets/images/icon-warning-v2.png';

  String get banner1 => 'assets/images/banner-1.png';

  String get banner2 => 'assets/images/banner-2.png';

  String get bankBNI => 'assets/images/bank-bni.png';

  String get linkAja => 'assets/images/linkaja.png';

  String get news1 => 'assets/images/picture 1.jpg';

  String get news2 => 'assets/images/picture 2.jpg';

  String get news3 => 'assets/images/picture 3.png';

  String get ups => 'assets/images/ups.jpg';

  List<String> get values => [verify, pin, kyc, ktp, selfie, selfieFrame, ktpFrame, risk, warning, banner1, banner2, linkAja, bankBNI, news1, news2, news3, ups];
}

class $AssetsFooterGen {
  const $AssetsFooterGen();

  String get footerIso => 'assets/images/iso2.png';

  String get footerOjk => 'assets/images/ojk.png';

  List<String> get values => [footerIso, footerOjk];
}

class $AssetsAvatarGen {
  const $AssetsAvatarGen();

  String get avatar_1 => 'assets/images/avatar-1.png';
  String get avatar_2 => 'assets/images/avatar-2.png';
  String get avatar_3 => 'assets/images/avatar-3.png';
  String get avatar_4 => 'assets/images/avatar-4.png';
  String get avatar_5 => 'assets/images/avatar-5.png';
  String get avatar_6 => 'assets/images/avatar-6.png';
  String get avatar_7 => 'assets/images/avatar-7.png';
  String get avatar_8 => 'assets/images/avatar-8.png';

  List<String> get values => [avatar_1, avatar_2, avatar_3, avatar_4, avatar_5, avatar_6, avatar_7, avatar_8];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  String get alert => 'assets/icons/Wrong.svg';

  String get warning => 'assets/icons/Warning.svg';

  String get check => 'assets/icons/Check.svg';

  String get question => 'assets/icons/Question.svg';

  List<String> get values => [alert, warning, check, question];
}

class Assets {
  Assets._();

  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsOnboardingGen onboarding = $AssetsOnboardingGen();
  static const $AssetsFooterGen footer = $AssetsFooterGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
  static const $AssetsAvatarGen avatar = $AssetsAvatarGen();
  
}