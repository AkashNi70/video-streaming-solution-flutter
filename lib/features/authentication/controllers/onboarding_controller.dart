import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../app_preferences.dart';
import '../screens/login/login.dart';
import '../screens/signup/signup.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //update current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump to the specific dot selected page.
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current index & jump to next page
  void loginPage() async{
    await AppPreferences().setFirstTime(false);
    Get.offAll(const LoginScreen());
  }

  void signupPage() async{
    await AppPreferences().setFirstTime(false);
    Get.offAll(const SignUpScreen());
  }

  //update current index & jump to the last page
  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
