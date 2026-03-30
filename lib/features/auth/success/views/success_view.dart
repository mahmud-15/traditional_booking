import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:traditional_booking/core/utils/app_images.dart';
import 'package:traditional_booking/core/widgets/image/common_image.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/button/common_button.dart';
import '../../../../core/widgets/text/common_text.dart';
import '../controllers/success_controller.dart';

class SuccessView extends GetView<SuccessController> {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Success Icon
             CommonImage(

                 height: 280,
                 width: 280,

                 imageSrc: AppImages.congrate),
              SizedBox(height: 20.h),

              // Title
              CommonText(
                text: "Congratulations!",
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: AppColors.textBlack,
              ),
              SizedBox(height: 16.h),

              // Subtitle
              CommonText(
                text:
                    "Your account is ready to use. You will be redirected to the Home page in a few seconds.",
                fontSize: 14
                ,
                right: 20,
                left: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              SizedBox(height: 48.h),

              // Button
              CommonButton(
                titleText: "Continue",
                titleWeight: FontWeight.w700,
                buttonColor: AppColors.primaryGreen,
                borderColor: AppColors.primaryGreen,
                buttonRadius: 100,
                onTap: controller.goToLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
