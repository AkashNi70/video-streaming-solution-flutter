import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/data/repositories/authentication_repository.dart';
import 'package:ottui/features/authentication/screens/login/login.dart';
import 'package:ottui/navigation_menu.dart';
import 'package:ottui/utils/popups/full_screen_loader.dart';
import 'package:ottui/utils/popups/loaders.dart';

import '../../../utils/constants/images_strings.dart';
import '../../../utils/network/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  var message = ''.obs;

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //start loader
      AppFullScreenLoader.openLoadingDialog(
          'We are processing you information...', AppImages.docerAnimation);

      //check internet connection
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        //remove loader
        AppFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove loader
        AppFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy validate
      if (!privacyPolicy.value) {
        //remove loader
        AppFullScreenLoader.stopLoading();
        AppLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      final response = await AuthenticationRepository.instance.signup(
          fullName.text.trim(), email.text.trim(), password.text.trim());
      message.value = response['VIDEO_STREAMING_APP'][0]['msg'];
      if (response['VIDEO_STREAMING_APP'][0]['success'] == '1') {
        //show success message
        AppLoaders.successSnackBar(
            title: 'Congratulations',
            message:
                'Your account has been created successfully.');

        // Navigate to home screen
        Get.offAll(() => const LoginScreen());
      } else {
        // Show snack bar with failure message
        AppLoaders.errorSnackBar(title: 'Oh Snap!', message: message.value);
      }
    } catch (e) {
      message.value = 'Error: $e';
      //remove loader
      AppFullScreenLoader.stopLoading();
      //show more generic error to the user
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: message.value);
    }
  }
}
