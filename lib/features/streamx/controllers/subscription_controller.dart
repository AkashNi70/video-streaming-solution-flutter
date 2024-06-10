import 'package:get/get.dart';
import 'package:ottui/data/repositories/subscription_repository.dart';
import 'package:ottui/utils/popups/loaders.dart';
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
    isLoading.value = true;
    try {
      final planRepo = Get.put(SubscriptionRepository());
      final fetchedPlans = await planRepo.fetchSubscriptionPlans();
      plans.assignAll(fetchedPlans);

    } catch (e) {
      // Handle error with a snack bar
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void selectPlan(int? value) {
    selectedPlan.value = value;
  }
}
