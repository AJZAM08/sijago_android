import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/textsytle.dart';
import '../../../../data/controllers/page_controller.dart';

class ButtonDetail extends StatelessWidget {
  final int pageIndex;
  final String title;
  final PageController pageController;

  ButtonDetail({
    required this.pageIndex,
    required this.title,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final PageControllerX controller = Get.find<PageControllerX>();

    return Obx(
      () => InkWell(
        onTap: () {
          pageController.animateToPage(
            pageIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          controller.changePage(pageIndex);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: controller.selectedPageIndex.value == pageIndex
                ? AppColors.primary
                : AppColors.whiteBg,
          ),
          child: Text(
            title,
            style: myTextStyle(
              fontSize: 12,
              color: controller.selectedPageIndex.value == pageIndex
                  ? AppColors.whiteBg
                  : AppColors.black150,
            ),
          ),
        ),
      ),
    );
  }
}
