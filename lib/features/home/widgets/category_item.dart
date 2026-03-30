import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final String iconPath;

  const CategoryItem({super.key, required this.name, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64.r,
          width: 64.r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(iconPath, style: TextStyle(fontSize: 28.sp)),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          name,
          style: AppTextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
