import 'package:evira_e_commerce/core/constants/app_styles.dart';
import 'package:evira_e_commerce/core/gen/assets.gen.dart';
import 'package:evira_e_commerce/core/lang_generated/l10n.dart';
import 'package:evira_e_commerce/core/theme/app_theme.dart';
import 'package:evira_e_commerce/shared/mixins/stateful_screen_mixin.dart';
import 'package:evira_e_commerce/shared/widgets/custom_button.dart';
import 'package:evira_e_commerce/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_toolkit/core/extensions/context_extensions.dart';
import 'package:my_flutter_toolkit/core/utils/text_field_utils/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with StatefulScreenMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  String get title => EviraLang.current.forgetPasswordTitle;

  Future<void> sendResetEmail() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    setState(() => loading = true);
    try {
      await Supabase.instance.client.auth.resetPasswordForEmail(
        emailController.text.trim(),
        redirectTo: 'blackcode://auth-callback',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent. Check your email.'),
        ),
      );
    } on AuthException catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            context.isDark
                ? Assets.images.forgotPasswordLogoDark.image(
                    width: context.screenWidth * .8,
                    height: context.screenHeight * .25,
                    fit: BoxFit.contain,
                  )
                : Assets.images.forgotPasswordLogoLight.image(
                    width: context.screenWidth * .8,
                    height: context.screenHeight * .25,
                    fit: BoxFit.contain,
                  ),
            SizedBox(height: 25.h),
            Text(
              'Enter your account email and we will send a secure reset link.',
              style: AppStyles.smallTextStyle18(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            Form(
              key: formKey,
              child: CustomTextField(
                fieldKey: 'resetEmail',
                controller: emailController,
                validator: (value) => Validators.email(value: value),
                hintText: EviraLang.of(context).email,
                perfixIcon: FontAwesomeIcons.solidEnvelope.data,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 30.h),
            CustomButton(
              title: loading ? 'Sending...' : EviraLang.of(context).continuee,
              onPressed: loading ? null : sendResetEmail,
              backgroundColor: loading
                  ? context.buttonInactiveColor
                  : context.buttonColor,
              textColor: loading
                  ? context.textInactiveColor
                  : context.buttonTextColor,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
