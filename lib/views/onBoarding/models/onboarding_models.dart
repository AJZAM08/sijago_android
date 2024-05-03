import '../../../core/assets/assets_gen.dart';

class OnboardingModel {
  final String logo = Assets.logo.logoSijago;
  final String image;
  final String title;
  final String desc;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}