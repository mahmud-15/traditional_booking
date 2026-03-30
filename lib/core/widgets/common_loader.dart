import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';

class CommonLoader extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool isOverlay;

  const CommonLoader({
    super.key,
    this.size,
    this.color,
    this.isOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isOverlay) {
      return Container(
        color: Colors.black.withValues(alpha: 0.3),
        child: Center(child: _buildLoader()),
      );
    }
    return Center(child: _buildLoader());
  }

  Widget _buildLoader() {
    return SizedBox(
      height: size ?? 40.r,
      width: size ?? 40.r,
      child: CircularProgressIndicator(
        color: color ?? AppColors.primary,
        strokeWidth: 3.w,
      ),
    );
  }
}
