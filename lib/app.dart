import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ottui/bindings/general_bindings.dart';
import 'package:ottui/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ottui/routes/app_routes.dart';
import 'package:ottui/utils/constants/colors.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';
import 'package:ottui/utils/theme/controller/theme_controller.dart';
import 'package:ottui/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(
          () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        theme: OttAppTheme.lightTheme,
        darkTheme: OttAppTheme.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        home: const Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(child: CircularProgressIndicator(color: AppColors.white)),
        ),
      ),
    );
  }
}
