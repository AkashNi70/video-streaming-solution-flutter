import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ottui/common/widgets/movies/movie_card_horizontal.dart';
import 'package:ottui/features/streamx/screens/watch_history/widgets/movie_card_history.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class WatchHistory extends StatelessWidget {
  const WatchHistory({Key? key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        title: const Text('Watch History'),
        flexibleSpaceWidget: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        showBackArrow: true,
        backgroundColor: dark
            ? AppColors.black.withAlpha(300)
            : AppColors.white.withAlpha(300),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.withOpacity(0.2),
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(Icons.delete, color: Colors.red),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.appBarHeight +
                MediaQuery.of(context).padding.top,
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: MovieCardHistory(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  color: dark ? AppColors.dark : AppColors.lightGrey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.sm, // Adjust vertical padding here
                      horizontal: AppSizes.sm, // Adjust horizontal padding here
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://videoportal.viavilab.com/upload/images/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.xs,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Kung Fu Pandaf fdfdf dfd',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: dark
                                      ? Colors.red.withOpacity(0.1)
                                      : AppColors.white,
                                ),
                                padding: const EdgeInsets.all(AppSizes.sm),
                                child: const Icon(Icons.delete, color: Colors.red),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
