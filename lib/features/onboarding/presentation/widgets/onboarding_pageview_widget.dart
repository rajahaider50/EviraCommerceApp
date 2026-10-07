import 'package:evira_e_commerce/core/extensions/extensions.dart';
import 'package:evira_e_commerce/features/onboarding/data/models/onboarding_model.dart';
import 'package:evira_e_commerce/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageViewWidget extends StatelessWidget {
  const OnboardingPageViewWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: OnboardingModel.onboardingList.length,
      clipBehavior: Clip.none,
      onPageChanged: (page) => context.read<OnboardingCubit>().next(page),
      itemBuilder: (context, index) {
        final onboarding = OnboardingModel.onboardingList[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                context.isDark ? onboarding.imageDark : onboarding.imageLight,
                fit: BoxFit.contain,
              ),
            ),
            24.verticalSpace,
            Text(
              onboarding.title,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.3,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
