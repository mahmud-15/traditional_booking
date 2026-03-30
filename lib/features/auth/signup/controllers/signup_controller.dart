import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final agreeToTerms = false.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void toggleTermsAgreement(bool? value) {
    if (value != null) agreeToTerms.value = value;
  }

  Future<void> signup() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!agreeToTerms.value) {
      Get.snackbar(
        'Error',
        'Please agree to terms and privacy policy',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    // Based on user flow, signup leads to email verification
    Get.toNamed(
      AppRoutes.otpVerification,
      arguments: {'email': emailController.text},
    ); // Wait, I need to check routes. Or Phone number screen? The 3rd screen is "Enter your phone number".
    // Actually, phone number is already collected in signup! So maybe the 3rd screen is a standalone phone login?
    // Looking at the screenshots, the 3rd screen says "Enter your phone number". Let's route to verification directly from signup.
  }

  void goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
