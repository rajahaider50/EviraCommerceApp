import 'package:evira_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color? shimmerBase;
  final Color? shimmerHighlight;

  const CustomColors({
    required this.shimmerBase,
    required this.shimmerHighlight,
  });

  @override
  CustomColors copyWith({
    Color? shimmerBase,
    Color? shimmerHighlight,
  }) {
    return CustomColors(
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t),
      shimmerHighlight: Color.lerp(shimmerHighlight, other.shimmerHighlight, t),
    );
  }

  static const light = CustomColors(
    shimmerBase: LightColorScheme.shimmerBaseColor,
    shimmerHighlight: LightColorScheme.shimmerHighlightColor,
  );

  static const dark = CustomColors(
    shimmerBase: DarkColorScheme.shimmerBaseColor,
    shimmerHighlight: DarkColorScheme.shimmerHighlightColor,
  );
}

extension CustomColorSchemeExtension on ColorScheme {
  CustomColors get customColors =>
      ThemeData.light().extension<CustomColors>() ?? CustomColors.light;

  Color get shimmerBase =>
      customColors.shimmerBase ?? LightColorScheme.shimmerBaseColor;
  Color get shimmerHighlight =>
      customColors.shimmerHighlight ?? LightColorScheme.shimmerHighlightColor;
}

extension CustomThemeExtension on BuildContext {
  CustomColors get customColors => Theme.of(this).extension<CustomColors>()!;
}