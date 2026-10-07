import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme _scaleTextTheme(TextTheme base) {
  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(fontSize: base.displayLarge?.fontSize?.sp),
    displayMedium: base.displayMedium?.copyWith(fontSize: base.displayMedium?.fontSize?.sp),
    displaySmall: base.displaySmall?.copyWith(fontSize: base.displaySmall?.fontSize?.sp),
    
    headlineLarge: base.headlineLarge?.copyWith(fontSize: base.headlineLarge?.fontSize?.sp),
    headlineMedium: base.headlineMedium?.copyWith(fontSize: base.headlineMedium?.fontSize?.sp),
    headlineSmall: base.headlineSmall?.copyWith(fontSize: base.headlineSmall?.fontSize?.sp),
    
    titleLarge: base.titleLarge?.copyWith(fontSize: base.titleLarge?.fontSize?.sp),
    titleMedium: base.titleMedium?.copyWith(fontSize: base.titleMedium?.fontSize?.sp),
    titleSmall: base.titleSmall?.copyWith(fontSize: base.titleSmall?.fontSize?.sp),
    
    bodyLarge: base.bodyLarge?.copyWith(fontSize: base.bodyLarge?.fontSize?.sp),
    bodyMedium: base.bodyMedium?.copyWith(fontSize: base.bodyMedium?.fontSize?.sp),
    bodySmall: base.bodySmall?.copyWith(fontSize: base.bodySmall?.fontSize?.sp),
    
    labelLarge: base.labelLarge?.copyWith(fontSize: base.labelLarge?.fontSize?.sp),
    labelMedium: base.labelMedium?.copyWith(fontSize: base.labelMedium?.fontSize?.sp),
    labelSmall: base.labelSmall?.copyWith(fontSize: base.labelSmall?.fontSize?.sp),
  );
}

TextTheme darkTextTheme() {
  final base = ThemeData.dark().textTheme;
  return _scaleTextTheme(base);
}

TextTheme lightTextTheme() {
  final base = ThemeData.light().textTheme;
  return _scaleTextTheme(base);
}
