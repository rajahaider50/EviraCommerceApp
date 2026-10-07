import 'package:evira_e_commerce/core/extensions/extensions.dart';
import 'package:evira_e_commerce/core/gen/assets.gen.dart';
import 'package:evira_e_commerce/core/routes/app_paths.dart';
import 'package:evira_e_commerce/features/social_auth/ui/widgets/continue_with_buttons_widget.dart';
import 'package:evira_e_commerce/features/social_auth/ui/widgets/dont_have_account_widget.dart';
import 'package:evira_e_commerce/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_toolkit/ui/widgets/custom_divider.dart';

class SocialAuthPage extends StatelessWidget {
  const SocialAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.verticalSpace,
                  Image.asset(
                    context.isDark
                        ? Assets.images.letsYouInDark.path
                        : Assets.images.letsYouInLight.path,
                    fit: BoxFit.contain,
                    height: 230.h,
                    width: context.screenWidth * 0.8,
                  ),
                  30.verticalSpace,
                  Text(
                    l10n.letsYouIn,
                    style: textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  30.verticalSpace,
                  const ContinueWithButtonsWidget(),
                  30.verticalSpace,
                  CustomDivider(
                    title: l10n.or.toUpperCase(),
                    color: colorScheme.outlineVariant,
                    textStyle: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  30.verticalSpace,
                  CustomButton(
                    title: l10n.signInWithPassword,
                    backgroundColor: colorScheme.primary,
                    textColor: colorScheme.onPrimary,
                    onPressed: () async {
                      context.push(AppPaths.login);
                    },
                  ),
                  12.verticalSpace,
                  const DontHaveAccountWidget(),
                  12.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
