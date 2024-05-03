import 'package:get/get.dart';
import 'package:sijago_android/views/other/page_jual.dart';
import 'package:sijago_android/views/portofolio/portofolio.dart';
import 'package:sijago_android/views/other/ubah_profile.dart';
import 'package:sijago_android/views/transactions/pages/pembelian/page_beli.dart';
import 'package:sijago_android/views/transactions/pages/pembelian/proses_bayar.dart';
import '../../views/auth/pages/login_page.dart';
import '../../views/auth/pages/register_page.dart';
import '../../views/auth/pages/verifications_page.dart';
import '../../views/auth/pages/verify_done.dart';
import '../../views/data/pages/KTP/detail_info.dart';
import '../../views/data/pages/KTP/guide_ktp.dart';
import '../../views/data/pages/KTP/kamera_ktp.dart';
import '../../views/data/pages/KTP/result_ktp.dart';
import '../../views/data/pages/NPWP/npwp_camera.dart';
import '../../views/data/pages/NPWP/npwp_result.dart';
import '../../views/data/pages/PIN/make_pin.dart';
import '../../views/data/pages/PIN/pin_done.dart';
import '../../views/data/pages/PIN/verify_pinn.dart';
import '../../views/data/pages/bank/bank_pencairan.dart';
import '../../views/data/pages/kyc_done.dart';
import '../../views/data/pages/selfie/result_selfie.dart';
import '../../views/data/pages/selfie/selfie_camera.dart';
import '../../views/data/pages/selfie/selfie_guide.dart';
import '../../views/home/pages/dashboard_page.dart';
import '../../views/home/pages/product_page.dart';
import '../../views/home/pages/profile_page.dart';
import '../../views/home/pages/transaksi_page.dart';
import '../../views/onBoarding/pages/onboarding_pages.dart';
import '../../views/onBoarding/splashscreen.dart';
import '../../views/other/onworking_page.dart';
import '../../views/profile_risk/risk_profile1.dart';
import '../../views/transactions/pages/pembelian/metode_bayar.dart';
import '../../views/transactions/pages/pembelian/pin_transaksi.dart';
import '../../views/transactions/widget/produk_info.dart';
import '../../views/transactions/pages/pembelian/transaksi_hasil.dart';
import 'route_name.dart';

class RouteApp {
  static final pages = [

    // First Screen
    GetPage(
      name: RouteName.root,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.onBoarding,
      page: () => const OnboardingPage(),
    ),

    // Authentication
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: RouteName.phoneVerify,
      page: () => VerificationPage(label: 'phone'),
    ),
    GetPage(
      name: RouteName.emailVerify,
      page: () => VerificationPage(label: 'email'),
    ),
    GetPage(
      name: RouteName.verifyDone,
      page: () => VerifyDone(),
    ),

    // Input User Data
    GetPage(
      name: RouteName.ktpGuide,
      page: () => GuideKTP(),
    ),
    GetPage(
      name: RouteName.ktpCamera,
      page: () => TakeKTP(),
    ),
    GetPage(
      name: RouteName.ktpResult,
      page: () => ResultKTP(),
    ),
    GetPage(
      name: RouteName.ktpDetails,
      page: () => DetailsField(),
    ),
    GetPage(
      name: RouteName.selfieGuide,
      page: () => GuideSelfie(),
    ),
    GetPage(
      name: RouteName.selfieCamera,
      page: () => TakeSelfie(),
    ),
    GetPage(
      name: RouteName.selfieResult,
      page: () => ResultSelfie(),
    ),
    GetPage(
      name: RouteName.npwpCamera,
      page: () => TakeNPWP(),
    ),
    GetPage(
      name: RouteName.npwpResult,
      page: () => ResultNPWP(),
    ),
    GetPage(
      name: RouteName.bankPencairan,
      page: () => BankPencairan(),
    ),
    GetPage(
      name: RouteName.kycDone,
      page: () => KYCDone(),
    ),
    GetPage(
      name: RouteName.makePIN,
      page: () => MakePIN(),
    ),
    GetPage(
      name: RouteName.verifyPIN,
      page: () => VerifyPIN(),
    ),
    GetPage(
      name: RouteName.pinDone,
      page: () => PINDone(),
    ),

    // Home
    GetPage(
      name: RouteName.dashboard,
      page: () => Dashboard(),
    ),
    GetPage(
      name: RouteName.productPage,
      page: () => ProductPage(),
    ),
    GetPage(
      name: RouteName.profilePage,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: RouteName.transaksiPage,
      page: () => TransaksiPage(),
    ),
    // GetPage(
    //   name: RouteName.productInfo,
    //   page: () => ProdukInfo(),
    // ),

    // Transaction Page
    GetPage(
      name: RouteName.pembelian,
      page: () => BeliPage(),
    ),
    GetPage(
      name: RouteName.metodeBayar,
      page: () => MetodeBayar(),
    ),
    GetPage(
      name: RouteName.prosesBayar,
      page: () => ProsesBayar(),
    ),
    GetPage(
      name: RouteName.pinInput,
      page: () => InputPIN(),
    ),
    GetPage(
      name: RouteName.transaksiGagal,
      page: () => HasilTransaksi(status: 'Gagal',),
    ),
    GetPage(
      name: RouteName.transaksiBerhasil,
      page: () => HasilTransaksi(status: 'Berhasil',),
    ),

    // Risk Profile
    GetPage(
      name: RouteName.riskProfile,
      page: () => RiskProfile1(),
    ),
    GetPage(
      name: RouteName.JualPage,
      page: () => JualPage(),
    ),
    GetPage(
      name: RouteName.UbahProfile,
      page: () => UbahProfile(),
    ),
    GetPage(
      name: RouteName.Portofolio,
      page: () => Portofolio(),
    ),
    GetPage(
      name: RouteName.onWorking,
      page: () => OnWorkingPage(),
    ),
  ];
}
