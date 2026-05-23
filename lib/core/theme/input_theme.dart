import 'package:flutter/material.dart';
import 'app_pallet.dart';

class AppInputTheme {
  AppInputTheme._();

  //Light Theme
  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppPalette.lightSurface,

    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppPalette.border),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppPalette.primary, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppPalette.error, width: 1.5),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppPalette.error, width: 2),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppPalette.border.withValues(alpha: 0.5)),
    ),

    hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppPalette.textSecondary),

    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppPalette.textSecondary),

    floatingLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppPalette.primary),

    errorStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppPalette.error),
  );

  //Dark Theme
  static final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppPalette.darkSurface,

    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppPalette.primary, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppPalette.error, width: 1.5),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppPalette.error, width: 2),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
    ),

    hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.6)),

    labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.7)),

    floatingLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppPalette.primary),

    errorStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppPalette.error),
  );
}
