import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ottui/utils/constants/text_strings.dart';
import 'package:ottui/utils/constants/images_strings.dart';
import 'package:ottui/utils/constants/sizes.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image section
                Image(
                  width: AppHelperFunctions.screenWidth() * 0.8,
                  height: AppHelperFunctions.screenHeight() * 0.4,
                  image: const AssetImage(AppImages.onBoardingImage1),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                // Title
                Text(
                  AppTexts.onBoardingTitle1,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                // Subtitle
                Text(
                  AppTexts.onBoardingSubTitle1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems * 2),
                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => controller.loginPage(),
                    child: const Text(AppTexts.signIn),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.signupPage(),
                    child: const Text(AppTexts.createAccount),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}