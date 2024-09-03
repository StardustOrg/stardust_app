import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class StarElevatedButtonTheme {
  StarElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
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

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
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
