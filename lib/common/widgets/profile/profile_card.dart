import 'package:flutter/material.dart';
import 'package:ottui/common/widgets/images/circular_image.dart';
import 'package:ottui/utils/constants/colors.dart';
import 'package:ottui/utils/constants/images_strings.dart';
import 'package:ottui/utils/constants/sizes.dart';

import '../../../app_preferences.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appPreferences = AppPreferences(); // Initialize AppPreferences
    String userName = appPreferences.getUserName();
    String userEmail = appPreferences.getUserEmail();

    // Check if name and email are empty, if so, use dummy data
    if (userName.isEmpty) {
      userName = 'John Doe';
    }
    if (userEmail.isEmpty) {
      userEmail = 'johndoe@example.com';
    }
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppCircularImage(image: AppImages.logo, width: 100, height: 100, backgroundColor: AppColors.dark,padding: 10,),
          const SizedBox(height: AppSizes.sm),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSizes.xs),
          Text(
            userEmail,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}