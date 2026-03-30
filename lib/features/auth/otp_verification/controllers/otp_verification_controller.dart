import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';

class OtpVerificationController extends GetxController {
  final otpController = TextEditingController();
  final isLoading = false.obs;
  final isError = false.obs;

  final countdown = 15.obs;
  final canResend = false.obs;
  Timer? _timer;

  final verificationTarget = "".obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();

    // Check if we navigated here from email signup or phone entry
    if (Get.arguments != null) {
      if (Get.arguments['phone'] != null) {
        verificationTarget.value = Get.arguments['phone'];
      } else if (Get.arguments['email'] != null) {
        verificationTarget.value = Get.arguments['email'];
      }
    }
  }

  void _startTimer() {
    canResend.value = false;
    countdown.value = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        canResend.value = true;
        _timer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    _timer?.cancel();
    super.onClose();
  }

  Future<void> verifyOtp(String otp) async {
    isError.value = false;

    if (otp.length < 6) {
      isError.value = true;
      _showErrorBottomSheet();
      return;
    }

    isLoading.value = true;
    // Simulate OTP verification
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    // Simulate an incorrect code check for demo (e.g., if code is 123456 it succeeds, else fails)
    // Here we'll just assume success unless it's exactly "000000"
    if (otp == "000000") {
      isError.value = true;
      _showErrorBottomSheet();
    } else {
      Get.offAllNamed(AppRoutes.success);
    }
  }

  void resendOtp() {
    if (canResend.value) {
      // Simulate resend API
      _startTimer();
      Get.snackbar(
        'Success',
        'Verification code resent.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _showErrorBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 24),
            const Text(
              "Incorrect code entered",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please check again the OTP code and\ntry again",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8DC63F), // primaryGreen
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Got it",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
