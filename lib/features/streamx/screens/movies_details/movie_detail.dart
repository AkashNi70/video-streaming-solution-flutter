import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ottui/common/widgets/appbar/appbar.dart';
import 'package:ottui/utils/constants/images_strings.dart';
import 'package:ottui/utils/constants/sizes.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';
import 'package:ottui/utils/constants/colors.dart';

import '../../../../common/widgets/movies/movie_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              AppImages.posterImage,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                MainAppBar(showBackArrow: true),
                SizedBox(height: AppSizes.buttonWidth / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Thumbnail Image
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            AppImages.thumbImage,
                            height: 250,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Play Button
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.primary,
                        ),
                        child: Icon(Icons.play_arrow_rounded, size: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:AppSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      Text(
                        'Movie Name',
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      Text(
                        'Wolverine is recovering from his injuries when he crosses paths with the loudmouth, Deadpool. They team up to defeat a common enemy.',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: AppSizes.spaceBtwSections),
                      AppSectionHeading(title: 'Recommended'),
                      SizedBox(height: AppSizes.spaceBtwItems),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of movies to display
                          itemBuilder: (context, index) {
                            return const MovieCardHorizontal(posterUrl: 'https://videoportal.viavilab.com/upload/images/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg');
                          },
                        ),
                      ),
                      // Add more details here if needed
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        size: 35,
      ),
    );
  }
}
