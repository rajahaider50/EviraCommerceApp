import 'package:evira_e_commerce/core/routes/app_paths.dart';
import 'package:evira_e_commerce/core/extensions/extensions.dart';
import 'package:evira_e_commerce/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evira_e_commerce/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, page) {
        return CustomButton(
          backgroundColor: colorScheme.primary,
          textColor: colorScheme.onPrimary,
          title: page == 2 ? l10n.getStarted : l10n.next,
          onPressed: () async {
            if (pageController.page == 2) {
              context.push(AppPaths.auth);
            } else {
              await pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
        );
      },
    );
  }
}
