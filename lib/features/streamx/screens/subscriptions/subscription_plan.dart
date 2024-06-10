import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottui/app_preferences.dart';
import 'package:ottui/common/widgets/containers/primary_header_container.dart';
import 'package:ottui/features/authentication/screens/login/login.dart';
import 'package:ottui/features/streamx/screens/payment_gateway/payment_gateway.dart';
import 'package:ottui/features/streamx/screens/subscriptions/widgets/dotted_line.dart';
import 'package:ottui/utils/constants/images_strings.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/subscription_controller.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  SubscriptionPlanScreen({super.key});

  final controller = Get.put(SubscriptionController());

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
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller.plans.isEmpty) {
                      return const Center(child: Text('No plans available'));
                    } else {
                      return Column(
                        children: controller.plans.map((plan) {
                          final int parsedPlanId = int.tryParse(plan.planId) ?? 0;
                          final isSelected = plan.planId == controller.selectedPlan.value.toString();
                          return Card(
                            color: isSelected ? AppColors.primary : AppColors.dark,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4),
                              child: RadioListTile<int>(
                                title: Text(
                                  plan.planName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? AppColors.black : AppColors.primary,
                                  ),
                                ),
                                subtitle: Text(
                                  '${plan.planDuration} - ${plan.planPrice} ${plan.currencyCode}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected ? AppColors.black : AppColors.primary,
                                  ),
                                ),
                                value: parsedPlanId,
                                groupValue: controller.selectedPlan.value,
                                activeColor: AppColors.dark,
                                onChanged: controller.selectPlan,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                  })

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Obx(() {
                return ElevatedButton(
                  onPressed: controller.selectedPlan.value != null
                      ? () {
                          if(AppPreferences().getIsLogin()){
                            Get.to(() => const PaymentGateway());
                          }else{
                            Get.to(() => const LoginScreen());
                          }
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
