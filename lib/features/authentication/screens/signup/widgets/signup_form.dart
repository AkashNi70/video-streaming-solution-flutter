import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: AppTexts.fullName,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: AppTexts.phoneNo,
            ),
          ),
        const SizedBox(height: AppSizes.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              labelText: AppTexts.password,
              suffixIcon: IconButton(
                icon: const Icon(Iconsax.eye),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
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
                              color:
                              dark ? AppColors.white : AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark
                                  ? AppColors.white
                                  : AppColors.primary)),
                      TextSpan(
                          text: '${AppTexts.and} ',
                          style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                          text: '${AppTexts.termsOfUse} ',
                          style: Theme.of(context).textTheme.bodySmall!.apply(
                              color:
                              dark ? AppColors.white : AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark
                                  ? AppColors.white
                                  : AppColors.primary)),
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
              onPressed: () {},
              child: const Text(AppTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
