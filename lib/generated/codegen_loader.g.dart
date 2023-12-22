// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> de_DE = {
  "title": "Movies Danish",
  "settings": "Settings Danish"
};
static const Map<String,dynamic> en_US = {
  "title": "Movies",
  "settings": "Settings"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"de_DE": de_DE, "en_US": en_US};
}
