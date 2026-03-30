import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/widgets/button/common_button.dart';
import '../../../../core/widgets/image/common_image.dart';
import '../../../../core/widgets/text/common_text.dart';
import '../../../../core/widgets/textfield/common_text_field.dart';
import '../controllers/login_controller.dart';
import '../../../../app/routes/app_routes.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors
          .bgLightGrey, // Very light grey backround to make the white card pop
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
                      text: "Log in to your\nAccount",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 12.h),

                    // Subtitle
                    CommonText(
                      text: "Enter your email and verify to log in",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),

                    // Google Button
                    _buildSocialButton(
                      icon: Image.asset(
                        AppImages.google,
                        height: 24.h,
                        width: 24.w,
                      ),
                      text: "Continue with Google",
                      onPressed: controller.loginWithGoogle,
                    ),
                    SizedBox(height: 16.h),

                    // Phone Button
                    _buildSocialButton(
                      icon: Image.asset(
                        AppImages.phone,
                        height: 24.h,
                        width: 24.w,
                      ),
                      text: "Continue with Phone",
                      onPressed: () => Get.toNamed(
                        AppRoutes.verification,
                      ), // Navigate to phone entry
                    ),
                    SizedBox(height: 16.h),

                    // Apple Button
                    ElevatedButton.icon(
                      onPressed: controller.loginWithApple,
                      icon: Icon(
                        Icons.apple,
                        size: 28.sp,
                        color: AppColors.white,
                      ),
                      label: CommonText(
                        text: "Continue with Apple",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        minimumSize: Size(double.infinity, 54.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        elevation: 0,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // OR divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.strokeGrey,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CommonText(
                            text: "Or",
                            fontSize: 12,
                            color: AppColors.textGrey,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.strokeGrey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // Email Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: "Email",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGrey,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: controller.emailController,
                      hintText: "Loisbecket@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      fillColor: AppColors.inputColor, // Very light grey
                      borderColor: Colors.transparent, // No obvious border
                      borderRadius: 10,
                    ),
                    SizedBox(height: 16.h),

                    // Password Field (assuming second field in mockup means password)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: "Password",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors
                            .textGrey, // Mockup has "Email" text again, but practically this is password. Using grey style.
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CommonTextField(
                      controller: controller.passwordController,
                      hintText: "Enter your password",
                      isPassword: true,
                      fillColor: AppColors.inputColor,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                    ),

                    SizedBox(height: 32.h),

                    // Login Button
                    Obx(
                      () => CommonButton(
                        titleText: "Log in",
                        titleWeight: FontWeight.w600,
                        titleSize: 16,
                        buttonColor: AppColors.primaryGreen,
                        borderColor: AppColors.primaryGreen,
                        buttonRadius: 100, // Capsule shape as in design
                        isLoading: controller.isLoading.value,
                        onTap: controller.login,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Create Account Link
                    GestureDetector(
                      onTap: controller.goToSignup,
                      child: CommonText(
                        text: "Create Account",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryGreen,
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

  // Helper method for the Outlined Social Buttons
  Widget _buildSocialButton({
    required Widget icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: CommonText(
        text: text,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textBlack,
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 54.h),
        side: BorderSide(color: AppColors.strokeGrey, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
