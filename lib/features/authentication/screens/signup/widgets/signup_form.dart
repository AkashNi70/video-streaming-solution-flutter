import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ottui/features/authentication/controllers/signup_controller.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.fullName,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: AppTexts.fullName,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
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
            },
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: AppTexts.phoneNo,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
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
          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value =
                          !controller.privacyPolicy.value))),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '${AppTexts.iAgreeTo} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${AppTexts.privacyPolicy} ',
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: dark ? AppColors.white : AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? AppColors.white : AppColors.primary)),
                      TextSpan(
                          text: '${AppTexts.and} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${AppTexts.termsOfUse} ',
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: dark ? AppColors.white : AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? AppColors.white : AppColors.primary)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
