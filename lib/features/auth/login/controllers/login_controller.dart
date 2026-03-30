import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter email and password',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.offAllNamed(AppRoutes.dashboard);
  }

  void loginWithGoogle() {
    // Implement Google login
  }

  void loginWithApple() {
    // Implement Apple login
  }

  void goToSignup() {
    Get.toNamed(AppRoutes.signup);
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }
}
