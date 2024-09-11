import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

/* -- Light & Dark Text Button Themes -- */
class StarTextButtonTheme {
  StarTextButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: StarColors.starBlue,
      disabledForegroundColor: StarColors.placeholder,
      disabledBackgroundColor: StarColors.placeholder,
      textStyle: const TextStyle(
        fontSize: 16,
        color: StarColors.starBlue,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: StarColors.textPrimary,
      backgroundColor: StarColors.placeholder,
      disabledForegroundColor: StarColors.placeholder,
      disabledBackgroundColor: StarColors.placeholder,
      padding: const EdgeInsets.all(StarSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16,
          color: StarColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(StarSizes.buttonRadius),
      ),
    ),
  );
}
