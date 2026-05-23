// app_text_theme.dart

import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/theme/app_pallet.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = const TextTheme(
    // ===== Display =====
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: -1,
      color: AppPalette.textPrimary,
    ),

    displayMedium: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      height: 1.2,
      letterSpacing: -0.5,
      color: AppPalette.textPrimary,
    ),

    // ===== Headlines =====
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, height: 1.25, color: AppPalette.textPrimary),

    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, height: 1.3, color: AppPalette.textPrimary),

    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3, color: AppPalette.textPrimary),

    // ===== Titles =====
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.4, color: AppPalette.textPrimary),

    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.4, color: AppPalette.textPrimary),

    titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.4, color: AppPalette.textPrimary),

    // ===== Body =====
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.6, color: AppPalette.textPrimary),

    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, color: AppPalette.textSecondary),

    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.5, color: AppPalette.textSecondary),

    // ===== Labels =====
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.4, color: AppPalette.textPrimary),

    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.4, color: AppPalette.textSecondary),

    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: 0.3,
      color: AppPalette.textSecondary,
    ),
  );

  static TextTheme darkTextTheme = lightTextTheme.apply(bodyColor: Colors.white, displayColor: Colors.white);
}
