import 'module/stateholder_module.dart';

mixin PresentationLayerInjection {
  static Future<void> configurePresentationLayerInjection() async {
    await StateHolderModule.configureStateHolderModuleInjection();
  }
}
