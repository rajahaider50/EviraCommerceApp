import 'package:evira_e_commerce/core/extensions/extensions.dart';
import 'package:evira_e_commerce/features/onboarding/data/models/onboarding_model.dart';
import 'package:evira_e_commerce/features/onboarding/presentation/widgets/next_button_widget.dart';
import 'package:evira_e_commerce/features/onboarding/presentation/widgets/onboarding_pageview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.verticalSpace,
              Expanded(
                child: OnboardingPageViewWidget(pageController: pageController),
              ),
              30.verticalSpace,
              _buildPageIndicatorWidget(colorScheme),
              30.verticalSpace,
              NextButtonWidget(pageController: pageController),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicatorWidget(ColorScheme colorScheme) {
    return SmoothPageIndicator(
      controller: pageController,
      count: OnboardingModel.onboardingList.length,
      effect: ExpandingDotsEffect(
        dotWidth: 10.h,
        dotHeight: 10.h,
        activeDotColor: colorScheme.onSurface,
        dotColor: colorScheme.outlineVariant,
      ),
    );
  }
}
