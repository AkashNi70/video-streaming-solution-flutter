import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ottui/features/authentication/controllers/login_controller.dart';
import 'package:ottui/features/authentication/screens/signup/signup.dart';
import 'package:ottui/features/streamx/screens/home/home.dart';
import 'package:ottui/navigation_menu.dart';
import 'package:ottui/utils/constants/sizes.dart';

import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: AppTexts.email,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                }),
            const SizedBox(height: AppSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: AppTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                        !controller.rememberMe.value)),
                    const Text(AppTexts.rememberMe),
                  ],
                ),

                //forgot password
                TextButton(
                    onPressed: () {},
                    child: const Text(AppTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),

            //sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.login(),
                    child: const Text(AppTexts.signIn))),

            const SizedBox(height: AppSizes.spaceBtwItems),

            //sign up button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: const Text(AppTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
