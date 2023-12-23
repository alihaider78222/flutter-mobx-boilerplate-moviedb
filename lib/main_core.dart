import 'package:flutter/material.dart';
import 'package:mobx_example/constants/app_theme.dart';
import 'package:mobx_example/core/settings/settings_controller.dart';
import 'package:mobx_example/generated/codegen_loader.g.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:easy_localization/easy_localization.dart';

import 'di/service_locator.dart';
import 'generated/locale_keys.g.dart';
import 'presentation/routes/routes.dart';

typedef FlavorCallback = FlavorConfig Function();

Future<void> initializeMain(FlavorCallback flavorCallback) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize flavor callback
  flavorCallback();

  await Future.wait([
    // initialize [service locator/ Dependency Injection] (get_it only)
    ServiceLocator.configureDependencies(),
    // initialize [Localization]
    EasyLocalization.ensureInitialized()
  ]);

  final SettingsController settingsController = getIt<SettingsController>();

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  settingsController.loadSettings();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/langs',
      assetLoader: const CodegenLoader(),
      startLocale: const Locale('de', 'DE'), // for testing
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(settingsController: settingsController),
    ),
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
            title: LocaleKeys.title.tr(),

            // Define a light and dark color theme. Then, read the user's preferred ThemeMode (light, dark, or system default)
            theme: themeDataLight,
            darkTheme: themeDataDark,
            themeMode: settingsController.themeMode,

            // Easy localization for Translation
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

            // Routes
            routes: <String, WidgetBuilder>{}..addAll(Routes.routes),
            initialRoute: Routes.settings.route,
          );
        });
  }
}
