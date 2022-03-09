import 'package:flutter/material.dart';
import 'package:piranhaapp/PiranhaApp.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'services/dependency_injection.dart';

class AppInitializer {
  initialise(Injector injector) async {}
}

late Injector injector;

void main() async {
  DependencyInjection().initialise(Injector());
  injector = Injector();
  await AppInitializer().initialise(injector);

  runApp(const PiranhaApp());
}
