import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/assets/assets_gen.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../../../data/controllers/user_controller.dart';
import '../../../data/routes/route_name.dart';
import '../models/onboarding_models.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
      image: Assets.onboarding.first,
      title: 'Selamat Datang di PNM SiJago!',
      desc:
          'PNM Sijago hadir untuk menjawab kebutuhan generasi milenial yang ingin berinvestasi reksa dana dengan mudah, murah, aman dan nyaman.',
    ),
    OnboardingModel(
      image: Assets.onboarding.second,
      title: 'Investasi Reksa Dana',
      desc:
          'Dengan PNM Sijago aplikasi investasi reksa dana online, investasi reksa dana dengan banyak pilihan produk kini dalam genggaman dan bisa dilakukan dimana – kapan saja.',
    ),
    OnboardingModel(
      image: Assets.onboarding.third,
      title: 'Ayo! investasi di PNM Sijago',
      desc: 'Ingat ya, Investasi yang paling baik adalah Mulai dari Sekarang.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var cek = Get.find<UserController>();
    void navigate() {
      cek.saveUserStatus(false);
      Get.offAllNamed(RouteName.login);
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 40.0),
                  child: SizedBox(
                    child: Image.asset(
                      Assets.logo.logoSijago,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                // SkipButton(onPressed: navigate),
              ],
            ),
            OnboardingContent(
              pageController: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              contents: onboardingData,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button.outlined(
                    width: Get.width / 3,
                    onPressed: () {
                      if (currentPage < onboardingData.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        currentPage++;
                        setState(() {});
                      } else {}
                    },
                    label: currentPage < onboardingData.length - 1
                        ? SkipButton(onPressed: () {
                            navigate();
                          })
                        : InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.onWorking);
                          },
                          child: Text(
                              'Simulasi',
                              style: myTextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ),
                  ),
                  OnboardingIndicator(
                    length: onboardingData.length,
                    currentPage: currentPage,
                  ),
                  Button.outlined(
                    width: Get.width / 3,
                    onPressed: () {
                      if (currentPage < onboardingData.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        currentPage++;
                        setState(() {});
                      } else {
                        navigate();
                      }
                    },
                    label: currentPage < onboardingData.length - 1
                        ? const Icon(
                            Icons.arrow_forward_rounded,
                          )
                        : Text(
                            'Done',
                            style: myTextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
