import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';
import 'package:stardust_app_skeleton/utils/theme/widgets_theme/elevated_button_theme.dart';
import 'package:stardust_app_skeleton/utils/theme/widgets_theme/outlined_button_theme.dart';
import 'package:stardust_app_skeleton/utils/theme/widgets_theme/text_button_theme.dart';
import 'package:stardust_app_skeleton/utils/theme/widgets_theme/text_field_theme.dart';
import 'package:stardust_app_skeleton/utils/theme/widgets_theme/text_theme.dart';

class StarTheme {
  StarTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: StarColors.bgLight,
    fontFamily: GoogleFonts.redHatText().fontFamily,
    brightness: Brightness.light,
    textTheme: StarTextTheme.lightTextTheme,
    inputDecorationTheme: StarTextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: StarElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: StarOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: StarTextButtonTheme.lightTextButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.redHatText().fontFamily,
    brightness: Brightness.dark,
    textTheme: StarTextTheme.darkTextTheme,
    inputDecorationTheme: StarTextFormFieldTheme.darkInputDecorationTheme,
    elevatedButtonTheme: StarElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
