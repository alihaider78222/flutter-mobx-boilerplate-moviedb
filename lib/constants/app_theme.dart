import 'package:flutter/material.dart';

import 'app_colors.dart';

var _fontFamily = 'Poppins';

//  Material
final ThemeData themeDataLight = ThemeData(
  // colorSchemeSeed: const Color(0xff6750a4),
  useMaterial3: true,
  fontFamily: _fontFamily,
  brightness: Brightness.light,

  primaryColor: AppColors.primary,
  primarySwatch: MaterialColor(
    AppColors.primarySwatch[500]!.value,
    AppColors.primarySwatch,
  ), // With flavor
  primaryColorDark: AppColors.primaryDark,
  primaryColorLight: AppColors.primaryLight,
  // accentColor: AppColors.primarySwatch[500],
  // accentColorBrightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,

  colorScheme: lightColorScheme,
  appBarTheme: lightAppBarTheme,
  // dialogBackgroundColor: AppColors.dialogBackgroundColorLight,

  // textTheme: _textTheme,
  // iconTheme: _textTheme,
  // primaryIconTheme: themeDataLight.primaryIconTheme.copyWith(),
);

final ThemeData themeDataDark = ThemeData(
  // colorSchemeSeed: const Color(0xff6750a4),
  useMaterial3: true,
  fontFamily: _fontFamily,
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  primarySwatch: MaterialColor(
    AppColors.primarySwatch[500]!.value,
    AppColors.primarySwatch,
  ), // With flavor
  primaryColorDark: AppColors.primaryDark,
  primaryColorLight: AppColors.primaryLight,
  // accentColor: AppColors.primarySwatch[500],
  // accentColorBrightness: Brightness.dark,
  scaffoldBackgroundColor: Color.fromARGB(255, 29, 29, 29),

  colorScheme: darkColorScheme,
  appBarTheme: darkAppBarTheme,
  // dialogBackgroundColor: AppColors.dialogBackgroundColorDark,

  // textTheme: _textTheme,
  // iconTheme: _textTheme,
  // primaryIconTheme: themeDataLight.primaryIconTheme.copyWith(),
);

// ---------------- Color scheme-------------------------------------
ColorScheme lightColorScheme = const ColorScheme(
  primary: AppColors.primarySchemaColorLight,
  // primaryContainer: AppColors.buttonBorderColor,
  secondary: Color(0xFFEFF3F3),
  secondaryContainer: Color(0xFFFAFBFB),
  background: Color(0xFFE6EBEB),
  surface: Colors.white, // dialog, drawer, bottom sheet background color
  onBackground: Colors.white,
  error: Colors.white, // _lightFillColor,
  onError: Colors.white, //_lightFillColor,
  onPrimary: Colors.white, //_lightFillColor,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);

ColorScheme darkColorScheme = const ColorScheme(
  primary: AppColors.primarySchemaColorDark,
  // primaryContainer: Color(0xFF1CDEC9),
  secondary: Color(0xFF4D1F7C),
  secondaryContainer: Color(0xFF451B6F),
  background: Color(0xFF241E30),
  surface: Color(0xFF1F1929),
  onBackground: Color.fromARGB(13, 192, 28, 28),
  // // White with 0.05 opacity
  error: Colors.cyan, //_darkFillColor,
  onError: Colors.red, // _darkFillColor,
  onPrimary: Colors.red, // _darkFillColor,
  onSecondary: Colors.cyan, //_darkFillColor,
  onSurface: Colors.white, // in [ dark mode ] text, icon color
  brightness: Brightness.dark,
);

// ---------------- Appbar theme-------------------------------------

AppBarTheme lightAppBarTheme = const AppBarTheme(
  backgroundColor: AppColors.backgroundColorAppBarLight,
  foregroundColor: Colors.white, // text color
);
AppBarTheme darkAppBarTheme = const AppBarTheme(
  backgroundColor: AppColors.backgroundColorAppBarDark,
  foregroundColor: Colors.white, // text color
);
