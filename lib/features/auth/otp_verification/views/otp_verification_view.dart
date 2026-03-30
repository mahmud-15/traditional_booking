import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/button/common_button.dart';
import '../../../../core/widgets/image/common_image.dart';
import '../../../../core/widgets/text/common_text.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),

              // Back Button Row
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.textBlack,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),

              SizedBox(height: 20.h),

              // The Main Card (containing everything)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.only(
                  top: 40.h,
                  bottom: 32.h,
                  left: 24.w,
                  right: 24.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo
                    CommonImage(
                      imageSrc: AppImages.logo,
                      height: 100.h,
                      width: 100.w,
                      fill: BoxFit.contain,
                    ),
                    SizedBox(height: 32.h),

                    // Title
                    CommonText(
                      text: "Verification",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 12.h),

                    // Subtitle
                    Obx(
                      () => CommonText(
                        text:
                            "Enter the 6-digit code sent to your\n${controller.verificationTarget.value.isNotEmpty ? controller.verificationTarget.value : "registered email"}",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    // OTP Label
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: "Enter OTP",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrey,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // OTP Input Fields
                    _buildOtpInput(context),
                    SizedBox(height: 24.h),

                    // Resend OTP / Timer
                    Obx(() {
                      if (controller.canResend.value) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: controller.resendOtp,
                            child: CommonText(
                              text: "No code received?",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryGreen,
                            ),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: CommonText(
                            text:
                                "Resend code in 00: ${controller.countdown.value.toString().padLeft(2, '0')}",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors
                                .textBlack, // Matches mockup "Resend code in 00: 15" dark grey check
                          ),
                        );
                      }
                    }),
                    SizedBox(height: 40.h),

                    // Verify Button
                    Obx(
                      () => CommonButton(
                        titleText: "Verify",
                        titleWeight: FontWeight.w600,
                        titleSize: 16,
                        buttonColor: AppColors.primaryGreen,
                        borderColor: AppColors.primaryGreen,
                        buttonRadius: 100,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          // Unfocus to hide keyboard before showing bottom sheet if needed
                          FocusScope.of(context).unfocus();
                          controller.verifyOtp(controller.otpController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  // A simple 6-digit OTP input builder using a single hidden textfield overlay
  // specifically tailored for the design: boxes with grey dots when empty.
  Widget _buildOtpInput(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Underlying functional text field
          Opacity(
            opacity: 0.0,
            child: TextField(
              controller: controller.otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              autofocus: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(counterText: ""),
              onChanged: (val) {
                // Remove error state on typing
                if (controller.isError.value) {
                  controller.isError.value = false;
                }
                (context as Element).markNeedsBuild();
              },
            ),
          ),

          // Visual Boxes overlay
          Obx(() {
            bool isError = controller.isError.value;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                String digit = "";
                if (controller.otpController.text.length > index) {
                  digit = controller.otpController.text[index];
                }

                bool isFilled = digit.isNotEmpty;

                Color borderColor =
                    AppColors.inputColor; // Default light gray border
                Color textColor =
                    AppColors.primaryGreen; // Default text color is green
                Color dotColor =
                    Colors.grey.shade400; // Original empty dot color

                if (isError) {
                  borderColor = Colors.red.shade300;
                  textColor = Colors.red;
                  dotColor = Colors.red.shade300;
                } else if (isFilled) {
                  borderColor = AppColors.primaryGreen;
                  textColor = AppColors.primaryGreen;
                }

                return Container(
                  width: 45.w,
                  height: 55.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.inputColor, // Like #F5F5F5
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: borderColor, width: 1.5),
                  ),
                  child: isFilled
                      ? CommonText(
                          text: digit,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        )
                      : Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: dotColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
