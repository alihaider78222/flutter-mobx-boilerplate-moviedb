import 'package:flutter/material.dart';
import 'package:mobx_example/core/settings/settings_controller.dart';
import 'package:mobx_example/presentation/screens/home/home.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:mobx_example/presentation/screens/settings/settings_screen.dart';

import 'di/service_locator.dart';

typedef FlavorCallback = FlavorConfig Function();

Future<void> initializeMain(FlavorCallback flavorCallback) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize flavor callback
  flavorCallback();

  // initialize [service locator/ Dependency Injection] (get_it only)
  await ServiceLocator.configureDependencies();

  final SettingsController settingsController = getIt<SettingsController>();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  settingsController.loadSettings();

  runApp(
    MyApp(settingsController: settingsController),
  );
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    required this.settingsController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',

            // Define a light and dark color theme. Then, read the user's preferred ThemeMode (light, dark, or system default)
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,

            home: const SettingsScreen(),
          );
        });
  }
}
