import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../../data/controllers/navbar_controller.dart';
import '../constant/colors.dart';

class CustomNavbar extends StatelessWidget {
  final PageController pageController;
  const CustomNavbar(
      {super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    var controller = Get.find<NavbarController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteBg,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 3,
              color: Colors.black.withOpacity(.2),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: GNav(
          rippleColor: AppColors.whiteBg,
          hoverColor: AppColors.primary,
          gap: 2,
          activeColor: AppColors.whiteBg,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.secoundry,
          color: AppColors.secoundry,
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Dashboard',
              onPressed: () {
                pageIndex = 0;
                pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                controller.changePage(pageIndex);
              },
            ),
            GButton(
              icon: LineIcons.productHunt,
              text: 'Produk',
              onPressed: () {
                pageIndex = 1;
                pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                controller.changePage(pageIndex);
              },
            ),
            GButton(
              icon: LineIcons.alternateExchange,
              text: 'Transaksi',
              onPressed: () {
                pageIndex = 2;
                pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                controller.changePage(pageIndex);
              },
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profil',
              onPressed: () {
                pageIndex = 3;
                pageController.animateToPage(
                  pageIndex,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                controller.changePage(pageIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
