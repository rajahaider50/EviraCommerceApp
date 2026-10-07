import 'package:evira_e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class PinTextField extends StatelessWidget {
  final TextEditingController pinController;
  final Function(String value)? onCompleted;
  final Function(String value) onChanged;
  final bool? isObscureText;
  final int length;

  const PinTextField({
    super.key,
    required this.pinController,
    this.onCompleted,
    required this.onChanged,
    this.isObscureText,
    this.length = 4,
  });

  @override
  Widget build(BuildContext context) {
    final double boxWidth = length > 4 ? 48.w : 80.w;
    final double boxHeight = length > 4 ? 56.h : 70.h;
    final double fontSize = length > 4 ? 18.sp : 20.sp;

    final defaultPinTheme = PinTheme(
      width: boxWidth,
      height: boxHeight,
      textStyle: GoogleFonts.urbanist(
        fontSize: fontSize,
        color: context.textColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: context.textFieldColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    final focusedPinTheme = PinTheme(
      width: boxWidth,
      height: boxHeight,
      textStyle: GoogleFonts.urbanist(
        fontSize: fontSize,
        color: context.textColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: context.textFieldColor,
        border: Border.all(color: context.textFieldBorderColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
    return Pinput(
      autofocus: true,
      controller: pinController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      length: length,
      obscureText: isObscureText ?? false,
      obscuringCharacter: '●',
      onCompleted: onCompleted,
      onChanged: onChanged,
    );
  }
}
