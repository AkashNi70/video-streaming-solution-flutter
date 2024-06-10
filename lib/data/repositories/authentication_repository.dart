import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ottui/app_preferences.dart';
import 'package:ottui/navigation_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ottui/features/authentication/screens/login/login.dart';
import 'package:ottui/features/authentication/screens/onboarding/onboarding.dart';
import '../../utils/constants/api.dart';
import '../../utils/constants/constants.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // SharedPreferences instance
  SharedPreferences? _preferences;

  @override
  void onReady() {
    super.onReady();
    _initializeApp();
  }

  // Initialize app components
  Future<void> _initializeApp() async {
    await _initSharedPreferences();
    FlutterNativeSplash.remove();
    await screenRedirect();
  }

  // Initialize SharedPreferences
  Future<void> _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Redirect based on the 'isFirstTime' preference and login state
  Future<void> screenRedirect() async {
    final appPreferences = AppPreferences();
    final bool isFirstTime = _preferences?.getBool('isFirstTime') ?? true;

    // Update 'isFirstTime' preference if necessary
    if (isFirstTime) {
      await _preferences?.setBool('isFirstTime', false);
    }

    // Check login state and redirect accordingly
    if (appPreferences.getIsLogin()) {
      Get.offAll(() => const NavigationMenu());
    } else {
      if (isFirstTime) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  // Sign up user
  Future<Map<String, dynamic>> signup(String name, String email, String password) async {
    try {
      // Prepare and encode data
      final Map<String, String> data = {
        'name': name,
        'email': email,
        'password': password,
        ...API().toJson()
      };
      final String encodedData = base64.encode(utf8.encode(json.encode(data)));
      final Map<String, String> body = {'data': encodedData};

      // Send POST request
      final response = await http.post(
        Uri.parse(Constants.signUpUrl),
        body: body,
      );

      // Handle response
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  // Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
      'brand': '',
      'model': '',
      'platform': 'Android OS',
      ...API().toJson()
    };
    final encodedData = base64.encode(utf8.encode(json.encode(data)));
    final body = {'data': encodedData};

    final response = await http.post(
      Uri.parse(Constants.loginUrl),
      body: body,
    );

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final decodedResponse = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return decodedResponse;
    } else {
      throw _handleError(response.statusCode, decodedResponse);
    }
  }

  Exception _handleError(int statusCode, Map<String, dynamic> response) {
    final errorMsg = response['VIDEO_STREAMING_APP'][0]['msg'];
    switch (statusCode) {
      case 400:
        return Exception('Bad Request: $errorMsg');
      case 401:
        return Exception('Unauthorized: $errorMsg');
      case 500:
        return Exception('Internal Server Error: $errorMsg');
      default:
        return Exception('Failed to login. Status: $statusCode, Message: $errorMsg');
    }
  }
}
