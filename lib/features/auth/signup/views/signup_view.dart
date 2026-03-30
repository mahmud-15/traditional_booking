import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/button/common_button.dart';
import '../../../../core/widgets/image/common_image.dart';
import '../../../../core/widgets/text/common_text.dart';
import '../../../../core/widgets/textfield/common_text_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              // App Logo
              Center(
                child: CommonImage(
                  imageSrc: AppImages.logo,
                  height: 120.h,
                  width: 120.w,
                  fill: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20.h),

              // The Main Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.only(
                  top: 20.h,
                  bottom: 20.h,
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
                    // Title
                    CommonText(
                      text: "Sign up to your\nAccount",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 12.h),

                    // Subtitle
                    CommonText(
                      text:
                          "Enter your name, email and verify to\nsign up account",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 24.h),

                    // Name Field
                    _buildLabel("Name"),
                    CommonTextField(
                      controller: controller.nameController,
                      hintText: "Lois",
                      fillColor: AppColors.inputColor,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),
                    SizedBox(height: 16.h),

                    // Email Field
                    _buildLabel("Email"),
                    CommonTextField(
                      controller: controller.emailController,
                      hintText: "Loisbecket@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      fillColor: AppColors.inputColor,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),
                    SizedBox(height: 16.h),

                    // Password Field
                    _buildLabel("Password"),
                    CommonTextField(
                      controller: controller.passwordController,
                      hintText: "*************",
                      isPassword: true,
                      fillColor: AppColors.inputColor,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),
                    SizedBox(height: 16.h),

                    // Confirm Password Field
                    _buildLabel("Confirm Password"),
                    CommonTextField(
                      controller: controller.confirmPasswordController,
                      hintText: "*************",
                      isPassword: true,
                      fillColor: AppColors.inputColor,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),
                    SizedBox(height: 16.h),

                    // Agree to Terms
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.agreeToTerms.value,
                            onChanged: controller.toggleTermsAgreement,
                            activeColor: AppColors.primaryGreen,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            side: const BorderSide(
                              color: AppColors.primaryGreen,
                              width: 1.5,
                            ),
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily:
                                    'Inter', // Assuming standard app font
                                color: AppColors.textGrey,
                              ),
                              children: [
                                const TextSpan(text: "I agree to the "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle Privacy Policy click
                                    },
                                ),
                                const TextSpan(text: " and "),
                                TextSpan(
                                  text: "Terms of Service",
                                  style: TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle Terms of Service click
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // Sign Up Button
                    Obx(
                      () => CommonButton(
                        titleText: "Sign up",
                        titleWeight: FontWeight.w600,
                        titleSize: 16,
                        buttonColor: AppColors.primaryGreen,
                        borderColor: AppColors.primaryGreen,
                        buttonRadius: 100,
                        isLoading: controller.isLoading.value,
                        onTap: controller.signup,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Login Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(
                          text: "Already have an account? ",
                          fontSize: 14,
                          color: AppColors.textGrey,
                        ),
                        GestureDetector(
                          onTap: controller.goToLogin,
                          child: CommonText(
                            text: "Log in",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryGreen,
                          ),
                        ),
                      ],
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

  Widget _buildLabel(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CommonText(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textGrey,
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
