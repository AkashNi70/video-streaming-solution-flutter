import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/app_preferences.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var message = ''.obs;
  var userID = '';
  var name = '';
  var emailId = '';
  var phoneNo = '';

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  /// Handles the login logic
  void login() async {
    try {
      // Start loader
      AppFullScreenLoader.openLoadingDialog('Logging you in...', AppImages.docerAnimation);

      // Check internet connection
      final isConnected = await NetworkManger.instance.isConnected();
      if (!isConnected) {
        // Remove loader and show no connection message
        AppFullScreenLoader.stopLoading();
        AppLoaders.errorSnackBar(title: 'Connection Error', message: 'No internet connection.');
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove loader
        AppFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        await AppPreferences().saveIsRemember(true);
        await AppPreferences().saveRemember(email.text.trim(), password.text.trim());
      } else {
        await AppPreferences().saveIsRemember(false);
      }

      // Perform login
      final response = await AuthenticationRepository.instance.login(email.text.trim(), password.text.trim());
      final responseData = response['VIDEO_STREAMING_APP'][0] as Map<String, dynamic>;
      message.value = responseData['msg'] as String;

      if (responseData['success'] == '1') {
        userID = responseData['user_id'].toString();
        name = responseData['name'].toString();
        emailId = responseData['email'].toString();
        phoneNo = responseData['phone'].toString();

        AppLoaders.successSnackBar(title: 'Success!', message: message.value);
        await AppPreferences().saveIsLogin(true);
        await AppPreferences().saveLogin(userID,name,emailId,phoneNo);

        AppFullScreenLoader.stopLoading();
        AuthenticationRepository.instance.screenRedirect();
      } else {
        AppFullScreenLoader.stopLoading();
        AppLoaders.errorSnackBar(title: 'Oh Snap!', message: message.value);
      }
    } catch (e) {
      // Handle error
      message.value = 'Error: $e';
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: message.value);
    }
  }
}
