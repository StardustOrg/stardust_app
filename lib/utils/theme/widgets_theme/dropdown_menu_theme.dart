import 'package:flutter/material.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class StarDropdownMenuTheme {
  StarDropdownMenuTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightDropdownButtonTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(width: 1, color: StarColors.starPink),
      ),
    ),
  );
}
