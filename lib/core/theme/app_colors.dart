import 'package:evira_e_commerce/core/gen/colors.gen.dart';
import 'package:flutter/material.dart';


extension AppColorContext on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

class LightColorScheme {
  static const Color primary = ColorName.primaryLight;
  static const Color secondary = ColorName.secondary;
  static const Color tertiary = ColorName.tertiary;
  static const Color surface = ColorName.surfaceLight;
  static const Color onSurface = ColorName.onSurfaceLight;
  static const Color background = ColorName.backgroundLight;
  static const Color onBackground = ColorName.onBackgroundLight;
  static const Color error = ColorName.error;
  static const Color errorContainer = ColorName.errorContainer;
  static const Color outline = ColorName.outline;
  static const Color outlineVariant = ColorName.outlineVariantLight;
  static const Color scrim = ColorName.scrim;
  static const Color onPrimary = ColorName.onPrimaryLight;
  static const Color onSecondary = ColorName.onSecondary;
  static const Color onTertiary = ColorName.onTertiary;
  static const Color onSurfaceVariant = ColorName.onSurfaceVariantLight;
  static const Color onError = ColorName.onError;
  static const Color shadow = ColorName.shadow;
  static const Color surfaceContainer = ColorName.surfaceContainerLight;
  static const Color surfaceContainerHigh = ColorName.surfaceContainerHighLight;
  static const Color shimmerBaseColor = Color(0xFFE0E0E0);
  static const Color shimmerHighlightColor = Color(0xFFF5F5F5);

}

class DarkColorScheme {
  static const Color primary = ColorName.primaryDark;
  static const Color secondary = ColorName.secondary;
  static const Color tertiary = ColorName.tertiary;
  static const Color surface = ColorName.surfaceDark;
  static const Color onSurface = ColorName.onSurfaceDark;
  static const Color background = ColorName.backgroundDark;
  static const Color onBackground = ColorName.onBackgroundDark;
  static const Color error = ColorName.error;
  static const Color errorContainer = ColorName.errorContainer;
  static const Color outline = ColorName.outline;
  static const Color outlineVariant = ColorName.outlineVariantDark;
  static const Color scrim = ColorName.scrim;
  static const Color onPrimary = ColorName.onPrimaryDark;
  static const Color onSecondary = ColorName.onSecondary;
  static const Color onTertiary = ColorName.onTertiary;
  static const Color onSurfaceVariant = ColorName.onSurfaceVariantDark;
  static const Color onError = ColorName.onError;
  static const Color shadow = ColorName.shadow;
  static const Color surfaceContainer = ColorName.surfaceContainerDark;
  static const Color surfaceContainerHigh = ColorName.surfaceContainerHighDark;
  static const Color shimmerBaseColor = Color(0xFF424242);
  static const Color shimmerHighlightColor = Color(0xFF616161);
}

