import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final obscurePassword = true.obs;

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.offAllNamed(AppRoutes.dashboard);
  }

  Future<void> signup() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.offAllNamed(AppRoutes.dashboard);
  }

  Future<void> forgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter your email",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.snackbar(
      "Success",
      "Password reset link sent to your email",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
