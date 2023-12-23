import 'package:flutter/material.dart';

class AppColors {
  // private constructor
  AppColors._();

  static const primary = Color(0xFFD0BFFF);
  static const primaryDark = Color(0xFF5F3DC4);
  static const primaryLight = Color(0xFFF2F0FF);
  static const primaryAccent = Color(0xFFD9D9D9);
  static const backgroundColor = Colors.white;

  // App bar
  static const backgroundColorAppBarLight = Color(0xFFD0BFFF);
  static const backgroundColorAppBarDark = Colors.black;

  // Dialog
  static const dialogBackgroundColorLight = Colors.white;
  static const dialogBackgroundColorDark = Color.fromARGB(255, 49, 49, 49);

  // Scheme color for Buttons, dialog background etc
  static const primarySchemaColorLight = Colors.green;
  static const primarySchemaColorDark = Color(0xFFFF8383);

  static const Map<int, Color> primarySwatch = <int, Color>{
    50: Color(0xFFE5F0F8),
    100: Color(0xFFBFDAEE),
    200: Color(0xFF95C1E2),
    300: Color(0xFF6AA8D6),
    400: Color(0xFF4A95CE),
    500: Color(0xFF2A82C5),
    600: Color(0xFF257ABF),
    700: Color(0xFF1F6FB8),
    800: Color(0xFF1965B0),
    900: Color(0xFF0F52A3)
  };
}
