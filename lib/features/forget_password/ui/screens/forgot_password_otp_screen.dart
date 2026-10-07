import 'package:evira_e_commerce/core/routes/app_paths.dart';
import 'package:evira_e_commerce/core/constants/app_styles.dart';
import 'package:evira_e_commerce/core/lang_generated/l10n.dart';
import 'package:evira_e_commerce/core/routes/app_router.dart';
import 'package:evira_e_commerce/core/theme/app_theme.dart';
import 'package:evira_e_commerce/shared/mixins/stateful_screen_mixin.dart';
import 'package:evira_e_commerce/shared/widgets/custom_button.dart';
import 'package:evira_e_commerce/shared/widgets/pin_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_resend_timer/otp_resend_timer.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  final String email;
  const ForgotPasswordOtpScreen({super.key, this.email = ''});

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen>
    with StatefulScreenMixin<ForgotPasswordOtpScreen> {
  late TextEditingController pinController;
  late OtpResendTimerController otpResendTimerController;
  bool isTimerFinished = false;
  bool isPinCompleted = false;
  bool isVerifying = false;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
    otpResendTimerController = OtpResendTimerController(initialTime: 60);
  }

  @override
  void dispose() {
    pinController.dispose();
    otpResendTimerController.dispose();
    super.dispose();
  }

  @override
  String get title => EviraLang.current.forgetPasswordTitle;

  Future<void> verifyOtp() async {
    if (pinController.text.length != 6) return;
    setState(() => isVerifying = true);
    try {
      final res = await Supabase.instance.client.auth.verifyOTP(
        email: widget.email,
        token: pinController.text.trim(),
        type: OtpType.recovery,
      );
      if (!mounted) return;
      if (res.session != null || res.user != null) {
        context.pushReplacement(AppPaths.createNewPassword);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid or expired OTP code')),
        );
      }
    } on AuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      if (mounted) setState(() => isVerifying = false);
    }
  }

  Future<void> resendOtp() async {
    if (widget.email.isEmpty) return;
    try {
      await Supabase.instance.client.auth.resetPasswordForEmail(
        widget.email,
        redirectTo: 'blackcode://auth-callback',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset code resent successfully.')),
      );
    } on AuthException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  @override
  Widget? buildBottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          title: isVerifying ? 'Verifying...' : EviraLang.of(context).verify,
          isLoading: isVerifying,
          onPressed: isPinCompleted && !isVerifying ? verifyOtp : null,
          backgroundColor: isPinCompleted
              ? context.buttonActiveColor
              : context.buttonInactiveColor,
          textColor: isPinCompleted
              ? context.textActiveColor
              : context.textInactiveColor,
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    final displayTarget =
        widget.email.isNotEmpty ? widget.email : 'your email';
    return Center(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Text(
              '${EviraLang.of(context).codeHasBeenSend} $displayTarget',
              style: AppStyles.smallTextStyle18(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70.h),
            PinTextField(
              pinController: pinController,
              length: 6,
              onCompleted: (value) {
                setState(() => isPinCompleted = value.length == 6);
                if (value.length == 6) {
                  verifyOtp();
                }
              },
              onChanged: (value) {
                setState(() {
                  isPinCompleted = value.length == 6;
                });
              },
            ),
            SizedBox(height: 50.h),
            OtpResendTimer(
              controller: otpResendTimerController,
              autoStart: true,
              timerMessage: EviraLang.of(context).resendCode,
              readyMessage: "",
              resendMessage: isTimerFinished
                  ? EviraLang.of(context).resend
                  : "",
              timerMessageStyle: GoogleFonts.urbanist(
                color: context.textColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
              resendMessageStyle: TextStyle(
                color: context.textColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
              onFinish: () {
                safeSetState(() => isTimerFinished = true);
              },
              onResendClicked: () {
                safeSetState(() => isTimerFinished = false);
                resendOtp();
              },
              onStart: () {
                safeSetState(() => isTimerFinished = false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
