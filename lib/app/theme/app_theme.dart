import 'package:flutter/material.dart';
import 'package:traditional_booking/core/utils/app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      error: AppColors.error,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.h2,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    dividerTheme: DividerThemeData(color: AppColors.divider, thickness: 1),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
    ),
    fontFamily: 'Roboto', // Default but can be customized
  );
}
