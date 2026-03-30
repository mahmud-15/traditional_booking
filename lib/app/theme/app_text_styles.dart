import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle get h1 => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle get h2 => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get h3 => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle get bodySmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle get buttonLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get caption => TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
