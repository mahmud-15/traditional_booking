import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/custom_appbar.dart';

class ForgotPasswordView extends GetView<AuthController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text("Reset Password 🔑", style: AppTextStyles.h1),
              SizedBox(height: 8.h),
              Text(
                "Enter your email address to receive a password reset link",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 48.h),
              CustomTextField(
                controller: controller.emailController,
                labelText: "Email Address",
                hintText: "Enter your registered email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 48.h),
              Obx(
                () => CustomButton(
                  text: "Send Reset Link",
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.forgotPassword(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
