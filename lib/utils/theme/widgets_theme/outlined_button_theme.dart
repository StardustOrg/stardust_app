import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class StarOutlinedButtonTheme {
  StarOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: StarColors.textSecondary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: StarColors.placeholder,
      disabledBackgroundColor: StarColors.placeholder,
      padding: const EdgeInsets.all(StarSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16,
          color: StarColors.textWhite,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: StarColors.textSecondary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(StarSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
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
