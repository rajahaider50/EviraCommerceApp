import 'package:evira_e_commerce/core/lang_generated/l10n.dart';
import 'package:flutter/material.dart';

extension L10nExtension on BuildContext {
  EviraLang get l10n => EviraLang.of(this);
}

extension StringExtension on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String countryCodeToEmoji() {
    return toUpperCase().runes
        .map((char) => String.fromCharCode(char + 127397))
        .join();
  } 
}

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

   ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  IconThemeData get iconTheme => theme.iconTheme;
}