import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/common/widgets/appbar/appbar.dart';
import 'package:ottui/common/widgets/movies/movie_card_horizontal.dart';
import 'package:ottui/common/widgets/texts/section_heading.dart';
import 'package:ottui/features/streamx/screens/home/widgets/sliders.dart';
import 'package:ottui/features/streamx/screens/movies/movies.dart';
import 'package:ottui/utils/constants/images_strings.dart';
import 'package:ottui/utils/constants/sizes.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    final ScrollController scrollController = ScrollController();
    final dark = AppHelperFunctions.isDarkMode(context);

    scrollController.addListener(() {
      controller.toggleBottomBarVisibility(scrollController.position.userScrollDirection);
    });

    // Titles of the sections to display
    final List<String> sectionTitles = [
      "Latest Movies",
      "Trending Now",
      "Popular Movies",
      "Top 10 Movies"
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        flexibleSpaceWidget: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: const Center(
          child: Image(
            height: AppSizes.iconLg * 1.4,
            image: AssetImage(AppImages.logo),
          ),
        ),
        backgroundColor: dark ? AppColors.black.withAlpha(300) : AppColors.white.withAlpha(300),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.appBarHeight + MediaQuery.of(context).padding.top),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeSlider(),
                const SizedBox(height: AppSizes.spaceBtwSections),
                // Dynamically generate sections based on titles
                ...sectionTitles.map((title) => buildMovieSection(title)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builds a section of movies with a heading
  Widget buildMovieSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(title: title, onPressed: () => Get.to(() => MoviesScreen(title: title,)),),
        const SizedBox(height: AppSizes.spaceBtwItems),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Number of movies to display
            itemBuilder: (context, index) {
              return MovieCardHorizontal(posterUrl: 'https://videoportal.viavilab.com/upload/images/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg');
            },
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
      ],
    );
  }
}
