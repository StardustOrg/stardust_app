import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardust_app_skeleton/utils/theme/widgets_theme/text_theme.dart';

class StarTheme {
  StarTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.redHatText().fontFamily,
    brightness: Brightness.light,
    textTheme: StarTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.redHatText().fontFamily,
    brightness: Brightness.dark,
    textTheme: StarTextTheme.darkTextTheme,
  );
}
