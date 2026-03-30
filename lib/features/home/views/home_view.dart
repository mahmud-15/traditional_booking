import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/category_item.dart';
import '../widgets/service_card.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24.h),
              _buildSearchBar(),
              SizedBox(height: 32.h),
              _buildSectionHeader("Categories", () {}),
              SizedBox(height: 16.h),
              _buildCategories(),
              SizedBox(height: 32.h),
              _buildSectionHeader("Featured Services", () {}),
              SizedBox(height: 16.h),
              _buildFeaturedList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Services",
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text("Traditional Booking", style: AppTextStyles.h2),
          ],
        ),
        Container(
          height: 48.r,
          width: 48.r,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(Icons.tune_outlined, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textPlaceholder, size: 24.sp),
          SizedBox(width: 12.w),
          Text(
            "Search for your services...",
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPlaceholder,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.h3),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            "See All",
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 100.h,
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => SizedBox(width: 20.w),
          itemBuilder: (context, index) {
            final cat = controller.categories[index];
            return CategoryItem(
              name: cat["name"] as String,
              iconPath: cat["icon"] as String,
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedList() {
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.featuredServices.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final service = controller.featuredServices[index];
          return ServiceCard(service: service);
        },
      ),
    );
  }
}
