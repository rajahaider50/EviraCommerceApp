import 'package:evira_e_commerce/core/gen/assets.gen.dart';
import 'package:evira_e_commerce/core/lang_generated/l10n.dart';

final class OnboardingModel {
  final String title;
  final String imageLight;
  final String imageDark;

  OnboardingModel({
    required this.title,
    required this.imageLight,
    required this.imageDark,
  });

  static final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: EviraLang.current.onboarding_title_1,
      imageDark: Assets.images.onboarding.onboardingDark1.path,
      imageLight: Assets.images.onboarding.onboardingLight1.path,
    ),
    OnboardingModel(
      title: EviraLang.current.onboarding_title_2,
      imageDark: Assets.images.onboarding.onboardingDark2.path,
      imageLight: Assets.images.onboarding.onboardingLight2.path,
    ),
    OnboardingModel(
      title: EviraLang.current.onboarding_title_3,
      imageDark: Assets.images.onboarding.onboardingDark3.path,
      imageLight: Assets.images.onboarding.onboardingLight3.path,
    ),
  ];
}
