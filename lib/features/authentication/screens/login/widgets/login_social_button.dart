import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ottui/utils/constants/colors.dart';
import 'package:ottui/utils/constants/sizes.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/images_strings.dart';

class LoginSocialButton extends StatelessWidget {
  const LoginSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppHelperFunctions.screenWidth() * 0.86,
          height: AppSizes.appBarHeight,
          decoration: BoxDecoration(
            color: dark ? AppColors.white : AppColors.light,
            borderRadius: BorderRadius.circular(12),
            boxShadow: dark ? null : [
              BoxShadow(
                color: AppColors.lightGrey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 5, // Blur radius
                offset: const Offset(0, 2), // Shadow position
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(
                  width: AppSizes.iconLg,
                  height: AppSizes.iconLg,
                  image: AssetImage(AppImages.google),
                ),
                Text(
                  "Login with Google",
                  style: TextStyle(
                    color: dark ? AppColors.black : AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500// Adjust this value as needed
                  ),
                ),
              ],
            )
          ),
        ),
      ],
    );
  }
}
