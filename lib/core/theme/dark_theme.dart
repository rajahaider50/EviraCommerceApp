import 'package:evira_e_commerce/core/theme/app_colors.dart';
import 'package:evira_e_commerce/core/theme/app_text_theme.dart';
import 'package:evira_e_commerce/core/theme/extensions/custom_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  final colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: DarkColorScheme.primary,
    secondary: DarkColorScheme.secondary,
    tertiary: DarkColorScheme.tertiary,
    surface: DarkColorScheme.surface,
    surfaceContainer: DarkColorScheme.surfaceContainer,
    error: DarkColorScheme.error,
    errorContainer: DarkColorScheme.errorContainer,
    outline: DarkColorScheme.outline,
    outlineVariant: DarkColorScheme.outlineVariant,
    scrim: DarkColorScheme.scrim,
    onPrimary: DarkColorScheme.onPrimary,
    onSecondary: DarkColorScheme.onSecondary,
    onTertiary: DarkColorScheme.onTertiary,
    onSurface: DarkColorScheme.onSurface,
    onSurfaceVariant: DarkColorScheme.onSurfaceVariant,
    onError: DarkColorScheme.onError,
    shadow: DarkColorScheme.shadow,
    surfaceContainerHigh: DarkColorScheme.surfaceContainerHigh,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    extensions: <ThemeExtension>[CustomColors.dark],
    textTheme: darkTextTheme(),
  );
}