
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sijago_android/data/controllers/data_controller.dart';
import 'package:sijago_android/views/portofolio/portofolio.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_appbar.dart';
import '../../../core/components/custom_navbar.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/size.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/navbar_controller.dart';
import '../widget/dashboard_widget/artikel_view.dart';
import '../widget/dashboard_widget/banner_horizontal.dart';
import '../widget/dashboard_widget/dashboard_header.dart';
// import '../widget/dashboard_widget/faq.dart';
import '../widget/dashboard_widget/product_view.dart';
import '../widget/dashboard_widget/risk_banner.dart';
import '../widget/dashboard_widget/warning_verify.dart';
import 'product_page.dart';
import 'profile_page.dart';
import 'transaksi_page.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var navbarCtrl = Get.put(NavbarController());
    var pageController = PageController();
    var dataCtrl = Get.find<UserData>();
    final userData = dataCtrl.userData.value;
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColors.whiteBg,
          appBar: navbarCtrl.selectedPageIndex.value == 0
              ? CustomAppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(Assets.avatar.avatar_3),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang!',
                                style: myTextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black150,
                                ),
                              ),
                              Obx(() {
                                if (dataCtrl.userData.value == null) {
                                  return Text(
                                    'Unknown',
                                    style: myTextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    userData?['username']?.toString() ?? '',
                                    style: myTextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  );
                                }
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          child: Image.asset(
                            Assets.logo.logoSijago,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              navbarCtrl.changePage(index);
            },
            children: [
              SizedBox(
                height: fullHeight,
                child: ListView(
                  children: [
                    InkWell(child: DashHeader(), onTap: () {
                      Get.to(() => Portofolio());
                    },),
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: AppColors.primary,
                      thickness: 2,
                    ),
                    RiskBanner(),
                    userData?['nik'] == null ?
                    Notify_Warning() : SizedBox(),
                    ProductView(),
                    BannerHorizontal(),
                    ArtikelView(),
                    // FAQBar(),
                    SizedBox(
                      height: fullHeight * .09,
                    ),
                  ],
                ),
              ),
              ProductPage(),
              TransaksiPage(),
              ProfilePage(),
            ],
          ),
          floatingActionButton: CustomNavbar(
            pageController: pageController,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
