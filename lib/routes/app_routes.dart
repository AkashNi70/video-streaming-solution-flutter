import 'package:get/get.dart';
import 'package:ottui/routes/routes.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/streamx/screens/home/home.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: MainAppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: MainAppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: MainAppRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: MainAppRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
// Add more GetPage entries as needed
}
