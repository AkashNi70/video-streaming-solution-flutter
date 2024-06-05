import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/movies/movie_card_verticle.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key, this.title}) : super(key: key);

  final String? title;

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
        title: Text(title ?? 'Movies', style: const TextStyle(fontSize: 20)),
        backgroundColor: dark ? AppColors.black.withAlpha(300) : AppColors.white.withAlpha(300),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.appBarHeight + MediaQuery.of(context).padding.top,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: _buildMovieGrid(),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieGrid() {
    return AppGridLayout(
      itemCount: 20,
      itemBuilder: (context, index) {
        return MovieCardVerticle(
          title: 'Title $index',
          posterUrl:
              'https://videoportal.viavilab.com/upload/images/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
        );
      }, // Ensure the controller is attached here
    );
  }
}
