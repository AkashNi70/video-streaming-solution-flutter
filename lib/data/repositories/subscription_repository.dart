import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ottui/utils/constants/api.dart';
import 'package:ottui/utils/constants/constants.dart';
import '../../features/streamx/models/subscription_plan_models.dart';

class SubscriptionRepository extends GetxController {
  static SubscriptionRepository get instance => Get.find<SubscriptionRepository>();

  Future<List<SubscriptionPlan>> fetchSubscriptionPlans() async {
    try {
      final data = API().toJson();
      final encodedData = base64.encode(utf8.encode(json.encode(data)));
      final body = {'data': encodedData};

      final response = await http.post(
        Uri.parse(Constants.planList),
        body: body,
      );

      return _handleResponse(response);
    } catch (e) {
      print('Failed to fetch subscription plans: $e');
      throw Exception('Failed to fetch subscription plans: $e');
    }
  }

  List<SubscriptionPlan> _handleResponse(http.Response response) {
    try {
      final decodedResponse = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        final List<dynamic> plansJson = decodedResponse['VIDEO_STREAMING_APP'];
        return plansJson.map((json) => SubscriptionPlan.fromJson(json)).toList();
      } else {
        throw _handleError(response.statusCode, decodedResponse);
      }
    } catch (e) {
      print('Failed to handle response: $e');
      throw Exception('Failed to handle response: $e');
    }
  }


  Exception _handleError(int statusCode, Map<String, dynamic> response) {
    final errorMsg = response['VIDEO_STREAMING_APP'][0]['message'];
    switch (statusCode) {
      case 400:
        return Exception('Bad Request: $errorMsg');
      case 401:
        return Exception('Unauthorized: $errorMsg');
      case 500:
        return Exception('Internal Server Error: $errorMsg');
      default:
        return Exception('Failed to fetch subscription plans. Status: $statusCode, Message: $errorMsg');
    }
  }
}
