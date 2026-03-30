import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import '../../app/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.showBackButton = true,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!, style: AppTextStyles.h3) : null,
      leading: showBackButton
          ? (leading ??
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 18.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ))
          : null,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
