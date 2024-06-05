import 'package:flutter/material.dart';
import 'package:ottui/common/widgets/images/circular_image.dart';
import 'package:ottui/utils/constants/colors.dart';
import 'package:ottui/utils/constants/images_strings.dart';
import 'package:ottui/utils/constants/sizes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCircularImage(image: AppImages.logo, width: 100, height: 100, backgroundColor: AppColors.dark,padding: 10,),
          SizedBox(height: AppSizes.sm),
          Text(
            'Akash Nishad',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppSizes.xs),
          Text(
            'akash20@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}