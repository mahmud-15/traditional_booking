import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';

class ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            height: 100.r,
            width: 100.r,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.image_outlined,
              color: AppColors.primary,
              size: 32.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.secondary,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            service["rating"].toString(),
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "\$${service["price"]}",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  service["title"] as String,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColors.textSecondary,
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      service["provider"] as String,
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
