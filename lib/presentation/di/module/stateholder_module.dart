import 'dart:async';

import 'package:mobx_example/core/settings/settings_controller.dart';
import 'package:mobx_example/core/settings/settings_service.dart';
import 'package:mobx_example/di/service_locator.dart';

mixin StateHolderModule {
  static Future<void> configureStateHolderModuleInjection() async {
    //
    // Settings (Theme, Font etc )
    //
    getIt.registerLazySingleton<SettingsController>(
      () => SettingsController(
        SettingsService(),
      ),
    );
  }
}
