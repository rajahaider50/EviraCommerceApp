import 'package:evira_e_commerce/core/gen/colors.gen.dart';
import 'package:evira_e_commerce/core/theme/app_colors.dart';
import 'package:evira_e_commerce/core/theme/app_text_theme.dart';
import 'package:evira_e_commerce/core/theme/extensions/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';

ThemeData lightTheme() {
  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: LightColorScheme.primary,
    secondary: LightColorScheme.secondary,
    tertiary: LightColorScheme.tertiary,
    surface: LightColorScheme.surface,
    surfaceContainer: LightColorScheme.surfaceContainer,
    error: LightColorScheme.error,
    errorContainer: LightColorScheme.errorContainer,
    outline: LightColorScheme.outline, 
    outlineVariant: LightColorScheme.outlineVariant,
    scrim: LightColorScheme.scrim,
    onPrimary: LightColorScheme.onPrimary,
    onSecondary: LightColorScheme.onSecondary,
    onTertiary: LightColorScheme.onTertiary,
    onSurface: LightColorScheme.onSurface,
    onSurfaceVariant: LightColorScheme.onSurfaceVariant,
    onError: LightColorScheme.onError,
    shadow: LightColorScheme.shadow,
    surfaceContainerHigh: LightColorScheme.surfaceContainerHigh,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    extensions: <ThemeExtension>[CustomColors.light],
    textTheme: lightTextTheme(),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorName.primaryLight,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: GoTransitions.fade,
        TargetPlatform.iOS: GoTransitions.cupertino,
        TargetPlatform.macOS: GoTransitions.cupertino,
      },
    ),
    scaffoldBackgroundColor: LightColorScheme.background,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: LightColorScheme.outline,
      selectionColor: LightColorScheme.outline.withAlpha(100),
      selectionHandleColor: LightColorScheme.outline,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: LightColorScheme.surface,
      surfaceTintColor: LightColorScheme.surface,
      dayStyle: TextStyle(color: LightColorScheme.onSurface),
      yearStyle: TextStyle(color: LightColorScheme.onSurface),
      dividerColor: LightColorScheme.outlineVariant,

      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(LightColorScheme.onSurface),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(LightColorScheme.onSurface),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      dragHandleColor: LightColorScheme.outlineVariant,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: LightColorScheme.surfaceContainer,
      filled: true,
    ),
  );
}