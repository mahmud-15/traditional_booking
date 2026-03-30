import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import 'package:traditional_booking/core/utils/app_images.dart';
import 'package:traditional_booking/core/widgets/image/common_image.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFDFDFD), // Foundation /White/white-50
      body: Center(
        child: CommonImage(
          imageSrc: AppImages.logo,

          fill: BoxFit.contain,
        ),
      ),
    );
  }
}
