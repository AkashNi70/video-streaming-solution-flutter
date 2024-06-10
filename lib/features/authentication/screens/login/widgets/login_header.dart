import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/features/streamx/screens/home/home.dart';
import 'package:ottui/navigation_menu.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              height: 150,
              image: AssetImage(
                  dark ? AppImages.lightLogo : AppImages.darkLogo),
            ),
            TextButton(
              onPressed: () {
                Get.offAll(() => const NavigationMenu());
              },
              child: const Text('Skip'),
            ),
          ],
        ),
        Text(
          AppTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSizes.sm),
        Text(
          AppTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
