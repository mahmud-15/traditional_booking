import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/utils/app_colors.dart';
import '../controllers/auth_controller.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/custom_appbar.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text("Create Account ✨", style: AppTextStyles.h1),
              SizedBox(height: 8.h),
              Text(
                "Join us for a seamless booking experience",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                controller: controller.nameController,
                labelText: "Full Name",
                hintText: "Enter your full name",
                prefixIcon: Icons.person_outline,
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                controller: controller.emailController,
                labelText: "Email Address",
                hintText: "Enter your email",
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                controller: controller.phoneController,
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 24.h),
              Obx(
                () => CustomTextField(
                  controller: controller.passwordController,
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: controller.obscurePassword.value,
                  suffixIcon: IconButton(
                    onPressed: () => controller.togglePasswordVisibility(),
                    icon: Icon(
                      controller.obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              Obx(
                () => CustomButton(
                  text: "Sign Up",
                  isLoading: controller.isLoading.value,
                  onPressed: () => controller.signup(),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
