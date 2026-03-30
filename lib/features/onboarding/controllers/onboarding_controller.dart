import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/utils/app_images.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  final onboardingData = [
    {
      "title": "Welcome to Your Travel Companion",
      "description":
          "Discover hotels, apartments, and unique stays around the world.",
      "image": AppImages.onboardingOne,
    },
    {
      "title": "Discover Perfect Stays Anywhere",
      "description":
          "Explore hotels, apartments, and unique properties in your favorite destinations. Find the perfect place for every trip.",
      "image": AppImages.onboardingTwo,
    },
    {
      "title": "Book Your Stay in Seconds",
      "description":
          "Choose your dates, confirm your stay, and pay securely all in one place.",
      "image": AppImages.onboardingThree,
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    if (currentPage.value < onboardingData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      skip();
    }
  }

  void skip() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
