import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import 'package:traditional_booking/core/widgets/button/common_button.dart';
import 'package:traditional_booking/core/widgets/text/common_text.dart';
import 'package:traditional_booking/core/widgets/image/common_image.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Images PageView
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingData.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final data = controller.onboardingData[index];
              return CommonImage(
                imageSrc: data["image"] as String,
                height: double.infinity,
                width: double.infinity,
                fill: BoxFit.cover,
              );
            },
          ),

          // Content Overlay
          SafeArea(
            child: Column(
              children: [
                const Spacer(),

                // Bottom content container with white gradient-like top if needed,
                // but usually a semi-transparent or solid white box in modern designs
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 40.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        final data = controller
                            .onboardingData[controller.currentPage.value];
                        return Column(
                          children: [
                            CommonText(
                              text: data["title"] as String,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textBlack,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 12.h),
                            CommonText(
                              text: data["description"] as String,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGrey,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 40.h),

                      // Next / Get Started Button
                      Obx(
                        () => CommonButton(
                          titleText:
                              controller.currentPage.value ==
                                  controller.onboardingData.length - 1
                              ? "Get Started"
                              : "Next",
                          buttonColor: AppColors.primaryGreen,
                          borderColor: AppColors.primaryGreen,
                          buttonRadius: 100, // Capsule shape
                          onTap: () => controller.next(),
                        ),
                      ),

                      // Page Indicator (Optional - but usually good UX)
                      SizedBox(height: 10.h),

                      // Obx(
                      //   () => Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: List.generate(
                      //       controller.onboardingData.length,
                      //       (index) => Container(
                      //         height: 6.h,
                      //         width: controller.currentPage.value == index
                      //             ? 24.w
                      //             : 6.w,
                      //         margin: EdgeInsets.only(right: 6.w),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(100),
                      //           color: controller.currentPage.value == index
                      //               ? AppColors.primaryGreen
                      //               : AppColors.strokeGrey,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Skip Button
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.w, top: 16.h),
                child: TextButton(
                  onPressed: () => controller.skip(),
                  child: CommonText(
                    text: "Skip",
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
