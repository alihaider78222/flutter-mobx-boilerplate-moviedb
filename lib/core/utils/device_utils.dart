import 'package:flutter/material.dart';

mixin DeviceUtils {
  static void openKeyboard(BuildContext context, FocusNode? focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
