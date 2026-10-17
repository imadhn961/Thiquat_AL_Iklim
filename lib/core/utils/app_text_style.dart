import 'package:flutter/material.dart';

/// Cairo type scale used across the app (weights 400-800).
// ignore_for_file: constant_identifier_names
class AppTextStyle {
  const AppTextStyle._();

  static const String _fontFamily = 'Cairo';

  /// Main screen titles — 28px / w800.
  static const TextStyle TextSize28 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );

  /// Section headers and large cards — 22px / w800.
  static const TextStyle TextSize22 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );

  /// Main button (CTA) text — 19px / w700.
  static const TextStyle TextSize19 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 19,
    fontWeight: FontWeight.w700,
  );

  /// Names, list items, subheadings — 17px / w700.
  static const TextStyle TextSize17 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w700,
  );

  /// Body/paragraph text, minimum readable size — 16px / w400.
  static const TextStyle TextSize16 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// Secondary text / tags — times, supporting details only — 14px / w600.
  static const TextStyle TextSize14 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
