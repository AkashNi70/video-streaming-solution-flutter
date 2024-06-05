import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/common/widgets/containers/primary_header_container.dart';
import 'package:ottui/features/streamx/screens/subscriptions/widgets/dotted_line.dart';
import 'package:ottui/utils/constants/images_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/subscription_controller.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  final SubscriptionController _controller = Get.put(SubscriptionController());

  SubscriptionPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  const MainAppBar(showBackArrow: true),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(AppImages.premiumIcon),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections * 1.8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium Features',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.checkIcon,
                        height: 25,
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        'Ad-Free Experience.',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.checkIcon,
                        height: 25,
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        'HD videos streaming.',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.checkIcon,
                        height: 25,
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Text(
                        'Enjoy unlimited movies.',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  const DottedLine(
                    color: AppColors.darkerGrey,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Obx(() {
                    if (_controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (_controller.plans.isEmpty) {
                      return const Center(child: Text('No plans available'));
                    } else {
                      return Column(
                        children: _controller.plans.map((plan) {
                          final isSelected =
                              plan.value == _controller.selectedPlan.value;
                          return Card(
                            color:
                                isSelected ? AppColors.primary : AppColors.dark,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2.0, vertical: 4),
                              child: RadioListTile<int>(
                                title: Text(
                                  plan.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? AppColors.black
                                        : AppColors.primary,
                                  ),
                                ),
                                subtitle: Text(
                                  plan.subtitle,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? AppColors.black
                                        : AppColors.primary,
                                  ),
                                ),
                                value: plan.value,
                                groupValue: _controller.selectedPlan.value,
                                activeColor: AppColors.dark,
                                onChanged: _controller.selectPlan,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Obx(() {
                return ElevatedButton(
                  onPressed: _controller.selectedPlan.value != null
                      ? () {
                          // Handle the continue action
                        }
                      : () {
                          // Show toast message if no plan selected
                          Get.snackbar('Error!', 'Please select any one plan.',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              margin: const EdgeInsets.all(10));
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.buttonHeight),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
