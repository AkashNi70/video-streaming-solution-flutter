import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:ottui/features/personalization/screens/settings/settings.dart';
import 'package:ottui/features/streamx/screens/movies/movies.dart';
import 'package:ottui/features/streamx/screens/search/search.dart';
import 'package:ottui/utils/constants/colors.dart';
import 'package:ottui/utils/helpers/helper_functions.dart';

import 'features/streamx/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: controller.isBottomBarVisible.value ? 80 : 0.0,
          child: Wrap(
            children: [
              NavigationBar(
                height: 80,
                elevation: 0,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) => controller.selectedIndex.value = index,
                backgroundColor: darkMode ? AppColors.black : AppColors.white,
                indicatorColor: darkMode ? AppColors.primary : AppColors.accent,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home, color: darkMode ? (controller.selectedIndex.value == 0 ? AppColors.black : AppColors.darkGrey) : (controller.selectedIndex.value == 0 ? AppColors.black : AppColors.black)),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(CupertinoIcons.search, size: 25, color: darkMode ? (controller.selectedIndex.value == 1 ? AppColors.black : AppColors.darkGrey) : (controller.selectedIndex.value == 1 ? AppColors.black : AppColors.black)),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.movie, color: darkMode ? (controller.selectedIndex.value == 2 ? AppColors.black : AppColors.darkGrey) : (controller.selectedIndex.value == 2 ? AppColors.black : AppColors.black)),
                    label: 'Movies',
                  ),
                  /*NavigationDestination(
                    icon: Icon(Icons.favorite, color: darkMode ? (controller.selectedIndex.value == 3 ? AppColors.black : AppColors.darkGrey) : (controller.selectedIndex.value == 3 ? AppColors.black : AppColors.black)),
                    label: 'Favorites',
                  ),*/
                  NavigationDestination(
                    icon: Icon(Icons.account_circle, color: darkMode ? (controller.selectedIndex.value == 3 ? AppColors.black : AppColors.darkGrey) : (controller.selectedIndex.value == 3 ? AppColors.black : AppColors.black)),
                    label: 'Profile',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final RxBool isBottomBarVisible = true.obs;

  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MoviesScreen(),
    // const FavouriteScreen(),
    const SettingsScreen(),
  ];

  void toggleBottomBarVisibility(ScrollDirection direction) {
    if (direction == ScrollDirection.reverse) {
      if (isBottomBarVisible.value) {
        isBottomBarVisible.value = false;
      }
    } else if (direction == ScrollDirection.forward) {
      if (!isBottomBarVisible.value) {
        isBottomBarVisible.value = true;
      }
    }
  }
}

