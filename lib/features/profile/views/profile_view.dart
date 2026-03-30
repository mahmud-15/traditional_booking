import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import 'package:traditional_booking/core/widgets/text/common_text.dart';
import 'package:traditional_booking/core/widgets/image/common_image.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.bgLightGrey,
        elevation: 0,
        centerTitle: true,
        title: CommonText(
          text: "Profile",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textBlack, // very dark blue/black
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFDFDFD),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Placeholder Avatar
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: AppColors.bgLightGrey,
                    backgroundImage: const NetworkImage(
                      "https://i.pravatar.cc/150?img=11",
                    ), // Temporary dummy image
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Tanvir Chowdhury",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack,
                        ),
                        SizedBox(height: 4.h),
                        CommonText(
                          text: "tanvirchowdhury123@gmail.com",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.edit_square,
                    color: AppColors.textGrey,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Become a Provider Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGreen.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(Icons.domain, color: Colors.white, size: 28.sp),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Become a Provider",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        SizedBox(height: 4.h),
                        CommonText(
                          text:
                              "List your property or services, start receiving bookings, and enjoy seamless payments.",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withValues(alpha: 0.9),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // General Menu Items Card
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFDFDFD),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 20.h,
                      bottom: 8.h,
                    ),
                    child: CommonText(
                      text: "General",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  _buildMenuItem(
                    Icons.person_outline,
                    "Profile Information",
                    () {},
                    true,
                  ),
                  _buildMenuItem(
                    Icons.lock_outline,
                    "Change Password",
                    () {},
                    true,
                  ),
                  _buildMenuItem(
                    Icons.calendar_today_outlined,
                    "My Bookings",
                    () {},
                    true,
                  ),
                  _buildMenuItem(
                    Icons.favorite_border,
                    "Favorites",
                    () {},
                    true,
                  ),
                  _buildMenuItem(
                    Icons.notifications_none_outlined,
                    "Notification",
                    () {},
                    false,
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Others Menu Items Card
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFDFDFD),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 20.h,
                      bottom: 8.h,
                    ),
                    child: CommonText(
                      text: "Others",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  _buildMenuItem(
                    Icons.support_agent_outlined,
                    "Help Center",
                    () {},
                    true,
                  ),
                  _buildMenuItem(
                    Icons.privacy_tip_outlined,
                    "Privacy policy",
                    () {},
                    true,
                  ),
                  _buildMenuItem(
                    Icons.description_outlined,
                    "Terms & Conditions",
                    () {},
                    true,
                  ),
                  _buildMenuItem(Icons.help_outline, "FAQ", () {}, true),
                  _buildMenuItem(
                    Icons.delete_outline,
                    "Delete Account",
                    () {},
                    false,
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
            SizedBox(height: 100.h), // Spacing for BottomNav
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap,
    bool showDivider,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20.sp,
                  color: AppColors.textBlack.withValues(alpha: 0.7),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CommonText(
                    text: title,
                    fontSize: 14,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack.withValues(alpha: 0.8),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 20.sp,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Divider(
              height: 1,
              thickness: 1,
              color: AppColors.strokeGrey.withValues(
                alpha: 0.3,
              ), // very faint line
            ),
          ),
      ],
    );
  }
}
