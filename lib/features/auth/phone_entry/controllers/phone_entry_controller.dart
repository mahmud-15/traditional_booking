import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';

class PhoneEntryController extends GetxController {
  final phoneController = TextEditingController();
  final isLoading = false.obs;
  final agreeToTerms = false.obs;
  final countryCode = '+61'.obs;

  // Statically defined common country codes
  final List<Map<String, String>> countryCodes = [
    {"code": "+61", "name": "Australia", "flag": "🇦🇺"},
    {"code": "+1", "name": "United States", "flag": "🇺🇸"},
    {"code": "+44", "name": "United Kingdom", "flag": "🇬🇧"},
    {"code": "+91", "name": "India", "flag": "🇮🇳"},
    {"code": "+880", "name": "Bangladesh", "flag": "🇧🇩"},
    {"code": "+971", "name": "United Arab Emirates", "flag": "🇦🇪"},
    {"code": "+60", "name": "Malaysia", "flag": "🇲🇾"},
    {"code": "+65", "name": "Singapore", "flag": "🇸🇬"},
  ];

  void setCountryCode(String code) {
    countryCode.value = code;
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void toggleTermsAgreement(bool? value) {
    if (value != null) agreeToTerms.value = value;
  }

  Future<void> sendOtp() async {
    if (phoneController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your phone number',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!agreeToTerms.value) {
      Get.snackbar(
        'Error',
        'Please agree to the Privacy Policy and Terms of Service',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    // Simulate sending OTP API execution
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    // Route to OTP screen
    Get.toNamed(
      AppRoutes.otpVerification,
      arguments: {'phone': '${countryCode.value} ${phoneController.text}'},
    );
  }

  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
