import 'package:flutter/material.dart';

class AppColors {
  // --- Colors from User's Design Palette ---

  // Primary Colors
  // Note: The labels in the image for the blue and green boxes seem copy-pasted incorrectly
  // (e.g. blue says "#FD713F Primary / Orange"), so using visual approximations for them.
  static const Color primaryBlue = Color(0xFF4AA5E3);
  static const Color primaryGreen = Color(0xFF8DC63F);

  // Background Colors
  static const Color bgBlack = Color(0xFF272727);
  static const Color bgLightGrey = Color(0xFFFAFAFA);
  static const Color bgWhite = Color(0xFFFFFFFF);
  static const Color bgLightOrange = Color(0xFFF8F4F1);

  // Text Colors
  static const Color textBlack = Color(0xFF272727);
  static const Color textGrey = Color(0xFF777777);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Stroke Colors
  static const Color strokeGrey = Color(0xFFF1F1F1);

  // Icons Colors
  static const Color iconOrange = Color(0xFFF5863F); // or F5865F
  static const Color iconWhite = Color(0xFFFFFFFF);
  static const Color iconBlack = Color(0xFF272727);
  static const Color iconGrey = Color(0xFF777777);

  // Warning Colors (Reds)
  static const Color warningMain = Color(0xFFFF3C3C);
  static const Color warningSupport1 = Color(0xFFFFBFAF);
  static const Color warningSupport2 = Color(0xFFFFD7D7);

  // Pending Colors (Yellow/Oranges)
  static const Color pendingMain = Color(0xFFE39400);
  static const Color pendingSupport1 = Color(0xFFF2E3C7);
  static const Color pendingSupport2 = Color(0xFFF5EDDD);

  // Success Colors (Greens)
  static const Color successMain = Color(0xFF2F832B);
  static const Color successSupport1 = Color(0xFFC2E2BE);
  static const Color successSupport2 = Color(0xFFDBE8D9);

  // --- App Theme Compatibility Aliases ---

  // Core theme colors used across the app widgets
  static const Color primary =
      primaryGreen; // Using the green from the button section as primary
  static const Color primaryColor = primaryGreen;
  static const Color secondary = primaryBlue;
  static const Color accent = pendingMain;

  static const Color background = bgLightGrey;
  static const Color surface = bgWhite;
  static const Color error = warningMain;

  static const Color textPrimary = textBlack;
  static const Color textSecondary = textGrey;
  static const Color textPlaceholder = Color(
    0xFF94A3B8,
  ); // Standard placeholder

  static const Color border = strokeGrey;
  static const Color divider = strokeGrey;

  // Shared Widget Color Compatibility
  static const Color black = bgBlack;
  static const Color white = bgWhite;
  static const Color purple =
      primaryBlue; // Replacing purple with brand blue for consistency
  static const Color inputColor = Color(
    0xFFF5F5F5,
  ); // Slightly darker than white for inputs
}
