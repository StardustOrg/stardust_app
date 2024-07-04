import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

class StarTextTheme {
  StarTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: StarColors.textPrimary,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: StarColors.textPrimary,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: StarColors.textPrimary,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: StarColors.textWhite,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: StarColors.textWhite,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: StarColors.textWhite,
    ),
  );
}
