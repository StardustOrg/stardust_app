import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

class StarTextFormFieldTheme {
  StarTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
    errorMaxLines: 3,
    prefixIconColor: StarColors.textSecondary,
    suffixIconColor: StarColors.textSecondary,
    // constraints: const BoxConstraints.expand(height: StarSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: StarSizes.fontSizeMd, color: StarColors.textSecondary),
    hintStyle: const TextStyle().copyWith(
        fontSize: StarSizes.fontSizeSm, color: StarColors.textSecondary),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: StarColors.starPink),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: StarColors.starPink),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: StarColors.starPink),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: StarColors.starPink),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: StarColors.textSecondary,
    suffixIconColor: StarColors.textSecondary,
    // constraints: const BoxConstraints.expand(height: StarSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: StarSizes.fontSizeMd, color: StarColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: StarSizes.fontSizeSm, color: StarColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: StarColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: StarColors.black),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: StarColors.black),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: StarColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 2, color: Colors.red),
    ),
  );
}
