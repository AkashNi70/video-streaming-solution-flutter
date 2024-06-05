import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ottui/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ottui/common/widgets/profile/profile_card.dart';
import 'package:ottui/utils/constants/text_strings.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        flexibleSpaceWidget: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: const Text('Profile Settings', style: TextStyle(fontSize: 20)),
        backgroundColor: dark
            ? AppColors.black.withAlpha(300)
            : AppColors.white.withAlpha(300),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.appBarHeight + MediaQuery.of(context).padding.top,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                //Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const ProfileCard(),
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      SizedBox(
                        width: AppSizes.buttonWidth * 1.5,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            elevation: 2,
                          ),
                          child: const Text(
                            'Change Picture',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                //heading information
                Card(
                  color: dark ? AppColors.dark : AppColors.lightGrey,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: Column(
                      children: [
                        const AppSectionHeading(
                            title: 'Personal Information',
                            textColor: AppColors.primary,
                            showActionButton: false),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            labelText: AppTexts.fullName,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_rounded),
                            labelText: AppTexts.email,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: AppTexts.phoneNo,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: AppTexts.password,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10)),
                            onPressed: () {},
                            child: Text('Update'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade700.withOpacity(0.05),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [ // Space between icon and text
                        Text(
                          'Close Account',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                        SizedBox(width: AppSizes.sm),
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
