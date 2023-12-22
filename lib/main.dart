import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:mobx_example/data/data_sources/remote/constants/network_constants.dart';
import 'main_core.dart' as core;
import 'core/config/flavors/flavors.dart';

void main() => core.initializeMain(
      () => FlavorConfig(
        name: Environment.PROD.name,
        variables: {
          'baseUrl': NetworkConstants.baseUrlDev,
          'connectionTimeout': NetworkConstants.connectionTimeout,
          'receiveTimeout': NetworkConstants.receiveTimeout,
        },
      ),
    );
