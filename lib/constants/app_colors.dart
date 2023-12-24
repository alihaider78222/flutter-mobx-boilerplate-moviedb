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

  static const black = Color(0xFF2E2739);
  static const lightGrey = Color(0xFFF6F6FA);
  static const grey = Color(0xFFDBDBDF);
  static const darkGrey = Color(0xFF827D88);
  static const blue = Color(0xFF61C3F2);

  static const cyan = Color(0xFF15D2BC);
  static const pink = Color(0xFFE26CA5);
  static const purple = Color(0xFF564CA3);
  static const yellow = Color(0xFFCD9D0F);
}
