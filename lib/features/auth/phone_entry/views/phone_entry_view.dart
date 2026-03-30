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
import '../controllers/phone_entry_controller.dart';

class PhoneEntryView extends GetView<PhoneEntryController> {
  const PhoneEntryView({super.key});

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
                  top: 32.h,
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
                    // Title
                    CommonText(
                      text: "Enter your phone\nnumber",
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
                          "Enter your phone number and verify to\nsign up account",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                    SizedBox(height: 32.h),

                    // Phone Field
                    CommonTextField(
                      controller: controller.phoneController,
                      hintText: "0000 0000 00",
                      keyboardType: TextInputType.phone,
                      fillColor: AppColors.inputColor,
                      borderColor: Colors.transparent,
                      borderRadius: 10,
                      prefixIcon: GestureDetector(
                        onTap: () => _showCountryCodePicker(context),
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 16.w),
                            Obx(
                              () => CommonText(
                                text: "(${controller.countryCode.value})",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGrey,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.primaryGreen,
                              size: 18.sp,
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              height: 24.h,
                              width: 1.w,
                              color: AppColors.strokeGrey,
                            ),
                            SizedBox(width: 12.w),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

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
                                fontFamily: 'Inter',
                                color: AppColors.textGrey,
                              ),
                              children: [
                                const TextSpan(text: "I agree to the "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: const TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                const TextSpan(text: " and "),
                                TextSpan(
                                  text: "Terms of Service",
                                  style: const TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),

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
                        onTap: controller.sendOtp,
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

  void _showCountryCodePicker(BuildContext context) {
    // Unfocus text field first if keyboard is open
    FocusScope.of(context).unfocus();

    Get.bottomSheet(
      Container(
        height: 400.h,
        padding: EdgeInsets.only(top: 24.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 4.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.strokeGrey,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 16.h),
            CommonText(
              text: "Select Country Code",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack,
            ),
            SizedBox(height: 16.h),
            Divider(color: AppColors.strokeGrey, height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: controller.countryCodes.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.strokeGrey.withValues(alpha: 0.5),
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final country = controller.countryCodes[index];
                  return InkWell(
                    onTap: () {
                      controller.setCountryCode(country["code"]!);
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            country["flag"]!,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(width: 12.w),
                          CommonText(
                            text: country["name"]!,
                            fontSize: 16,
                            textAlign: TextAlign.left,
                            color: AppColors.textBlack,
                          ),
                          Spacer(),
                          CommonText(
                            text: country["code"]!,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryGreen,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}
