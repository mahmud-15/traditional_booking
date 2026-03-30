import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import 'package:traditional_booking/core/widgets/text/common_text.dart';

class CommonBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CommonBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Current Tabs exactly matching the Figma screenshot provided
    List<IconData> icons = [
      Icons.home,
      Icons.apartment,
      Icons.settings,
      Icons.message,
      Icons.person,
    ];

    List<String> titleList = [
      "Home",
      "Properties",
      "Services",
      "Message",
      "Profile",
    ];

    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.r), // Complete pill shape
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(titleList.length, (index) {
          bool isSelected = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[index],
                    color: isSelected
                        ? AppColors.primaryGreen
                        : Colors.grey.shade400,
                    size: 28.sp,
                  ),
                  SizedBox(height: 4.h),
                  CommonText(
                    fontSize: 12,
                    color: isSelected
                        ? AppColors.primaryGreen
                        : Colors.grey.shade400,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    text: titleList[index],
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
