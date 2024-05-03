import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/textsytle.dart';
import '../models/onboarding_models.dart';

class OnboardingContent extends StatelessWidget {
  final PageController pageController;
  final void Function(int index) onPageChanged;
  final List<OnboardingModel> contents;

  const OnboardingContent({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Image.asset(
                    width: 300,
                    height: 300,
                    contents[index].image,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  contents[index].title,
                  style: myTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  contents[index].desc,
                  style: myTextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black150,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
