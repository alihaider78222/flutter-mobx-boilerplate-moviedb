import 'package:get_it/get_it.dart';

import '../data/di/data_layer_injection.dart';
import '../domain/di/domain_layer_injection.dart';
import '../presentation/di/presentation_layer_injection.dart';

final getIt = GetIt.instance;

mixin ServiceLocator {
  static Future<void> configureDependencies() async {
    await DataLayerInjection.configureDataLayerInjection();
    await DomainLayerInjection.configureDomainLayerInjection();
    await PresentationLayerInjection.configurePresentationLayerInjection();
  }
}
