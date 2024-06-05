import 'package:get/get.dart';

import '../models/subscription_plan_models.dart';

class SubscriptionController extends GetxController {
  var selectedPlan = Rx<int?>(null);
  var plans = <SubscriptionPlan>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPlans();
  }

  Future<void> fetchPlans() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 2));
    plans.value = [
      SubscriptionPlan(title: '₹ 199.00 / month', subtitle: 'Monthly Subscription', value: 1),
      SubscriptionPlan(title: '₹ 499.00 / quarter', subtitle: 'Quarterly Subscription', value: 2),
      SubscriptionPlan(title: '₹ 899.00 / half-year', subtitle: 'Half-Yearly Subscription', value: 3),
      SubscriptionPlan(title: '₹ 1499.00 / year', subtitle: 'Yearly Subscription', value: 4),
    ];
    isLoading.value = false;
  }

  void selectPlan(int? value) {
    selectedPlan.value = value;
  }
}
