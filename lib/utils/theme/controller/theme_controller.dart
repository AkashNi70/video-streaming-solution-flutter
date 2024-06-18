import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = AppPreferences().getIsDarkMode();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    AppPreferences().saveIsDarkMode(isDarkMode.value); // Save preference
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
