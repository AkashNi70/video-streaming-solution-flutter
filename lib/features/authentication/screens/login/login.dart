import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ottui/features/authentication/screens/login/widgets/login_form_divider.dart';
import 'package:ottui/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ottui/features/authentication/screens/login/widgets/login_social_button.dart';
import 'package:ottui/utils/constants/sizes.dart';
import 'package:ottui/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //login form header
              const LoginHeader(),

              //login form
              const LoginForm(),

              //login form divider
              LoginFormDivider(dividerText: AppTexts.orSignInWith.capitalize!),

              const SizedBox(height: AppSizes.spaceBtwSections),

              const LoginSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
