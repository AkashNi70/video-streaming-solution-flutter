import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/app_preferences.dart';
import 'package:ottui/common/widgets/appbar/appbar.dart';
import 'package:ottui/common/widgets/dynamic_page/dynamic_page.dart';
import 'package:ottui/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:ottui/common/widgets/texts/section_heading.dart';
import 'package:ottui/features/personalization/screens/profile/profile.dart';
import 'package:ottui/common/widgets/profile/profile_card.dart';
import 'package:ottui/features/streamx/screens/subscriptions/subscription_plan.dart';
import 'package:ottui/features/streamx/screens/watch_history/watch_history.dart';
import 'package:ottui/utils/constants/text_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/theme/controller/theme_controller.dart';
import '../../../authentication/screens/login/login.dart';
import '../../../authentication/screens/signup/signup.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(
        flexibleSpaceWidget: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: const Text('Settings', style: TextStyle(fontSize: 20)),
        backgroundColor: dark
            ? AppColors.black.withAlpha(300)
            : AppColors.white.withAlpha(300),
        showBackArrow: false,
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
                const ProfileCard(),
                const SizedBox(height: AppSizes.spaceBtwSections),
                const AppSectionHeading(
                    title: 'Account Settings', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),
                AppSettingsMenuTile(
                  icon: Icons.edit,
                  title: 'Profile Settings',
                  onTap: () => Get.to(() => const ProfileScreen()),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: dark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                AppSettingsMenuTile(
                  icon: Icons.subscriptions,
                  title: 'Subscribe Now',
                  onTap: () => Get.to(() => SubscriptionPlanScreen()),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: dark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                AppSettingsMenuTile(
                  icon: Icons.history,
                  title: 'Watch History',
                  onTap: () => Get.to(() => const WatchHistory()),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: dark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                const AppSectionHeading(
                    title: 'Policies', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),
                AppSettingsMenuTile(
                  icon: Icons.privacy_tip,
                  title: AppTexts.termsOfUse,
                  onTap: () => Get.to(() => const DynamicPage(title: AppTexts.termsOfUse, dataUrl: 'https://videoapi.softintraproduct.in/page/terms-of-use',)),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: dark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                AppSettingsMenuTile(
                  icon: Icons.policy,
                  title: AppTexts.privacyPolicy,
                  onTap: () => Get.to(() => const DynamicPage(title: AppTexts.privacyPolicy, dataUrl: 'https://videoapi.softintraproduct.in/page/privacy-policy',)),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: dark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                AppSettingsMenuTile(
                  icon: Icons.policy,
                  title: AppTexts.refundPolicy,
                  onTap: () => Get.to(() => const DynamicPage(title: AppTexts.refundPolicy, dataUrl: 'https://videoapi.softintraproduct.in/page/privacy-policy',)),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: dark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                const AppSectionHeading(
                    title: 'App Settings', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),
                AppSettingsMenuTile(
                  icon: Icons.notifications,
                  title: 'Notification',
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.black,
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.light,
                    inactiveThumbColor: AppColors.black,
                  ),
                ),
                Obx(
                      () => AppSettingsMenuTile(
                    icon: themeController.isDarkMode.value
                        ? Icons.dark_mode
                        : Icons.light_mode,
                    title: themeController.isDarkMode.value
                        ? 'Dark Mode'
                        : 'Light Mode',
                    onTap: () => themeController.toggleTheme(),
                    trailing: Switch(
                      value: themeController.isDarkMode.value,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                      activeColor: AppColors.black,
                      activeTrackColor: AppColors.primary,
                      inactiveTrackColor: AppColors.light,
                      inactiveThumbColor: AppColors.black,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      if(AppPreferences().getIsLogin()){
                        print('Logout');
                      }else{
                        Get.offAll(() => const LoginScreen());
                      }
                    },
                    child: Text(AppPreferences().getIsLogin() ? 'Logout' : 'Login'),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwSections * 2.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
