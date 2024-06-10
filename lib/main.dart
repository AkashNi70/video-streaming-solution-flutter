import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ottui/data/repositories/authentication_repository.dart';

import 'app.dart';
import 'app_preferences.dart';

Future<void> main() async {
  //add widgets binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize AppPreferences
  final appPreferences = AppPreferences();
  await appPreferences.init();

  //await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initialize repository
  Get.put(AuthenticationRepository());

  runApp(const App());
}



