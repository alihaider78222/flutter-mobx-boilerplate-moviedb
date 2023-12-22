import 'package:flutter/material.dart';
import 'package:mobx_example/presentation/screens/home/home.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'di/service_locator.dart';

typedef FlavorCallback = FlavorConfig Function();

Future<void> initializeMain(FlavorCallback flavorCallback) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize flavor callback
  flavorCallback();

  // initialize [service locator/ Dependency Injection] (get_it only)
  await ServiceLocator.configureDependencies();

  runApp(
    const MyApp(),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
