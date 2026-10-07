import 'package:evira_e_commerce/core/di/di.dart';
import 'package:evira_e_commerce/core/extensions/extensions.dart';
import 'package:evira_e_commerce/core/gen/assets.gen.dart';
import 'package:evira_e_commerce/core/services/toast_service.dart';
import 'package:evira_e_commerce/shared/cubits/app_flow_cubit.dart';
import 'package:evira_e_commerce/shared/cubits/social_auth_cubit.dart';
import 'package:evira_e_commerce/shared/widgets/custom_sign_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueWithButtonsWidget extends StatelessWidget {
  const ContinueWithButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        BlocConsumer<SocialAuthCubit, SocialAuthState>(
          listener: (context, state) {
            if (state is GoogleAuthSuccess) {
              context.read<AppFlowCubit>().checkUserState();
            } else if (state is GoogleAuthFailure) {
              getIt<ToastService>().showErrorToast(
                message: state.message,
                context: context,
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is GoogleAuthLoading;
            return CustomSignButton(
              isLoading: isLoading,
              title: l10n.continueWithGoogle,
              icon: Assets.icons.google.svg(width: 30.h, height: 30.h),
              onPressed: () async {
                await context.read<SocialAuthCubit>().signInWithGoogle();
              },
            );
          },
        ),
      ],
    );
  }
}
