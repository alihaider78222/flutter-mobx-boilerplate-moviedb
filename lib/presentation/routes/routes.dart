import 'package:flutter/material.dart';
import 'package:mobx_example/presentation/screens/home/home.dart';
import 'package:mobx_example/presentation/screens/settings/settings_screen.dart';

enum Routes {
  home("/home"),
  settings("/settings");

  final String route;
  const Routes(this.route);

  static final routes = <String, WidgetBuilder>{
    Routes.home.route: (BuildContext context) => MyHomePage(),
    Routes.settings.route: (BuildContext context) => SettingsScreen(),
  };
}
