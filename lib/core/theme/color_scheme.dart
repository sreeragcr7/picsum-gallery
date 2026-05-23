// app_color_scheme.dart

import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/theme/app_pallet.dart';

class AppColorScheme {
  AppColorScheme._();

  //Light theme
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppPalette.primary,
    brightness: Brightness.light,

    primary: AppPalette.primary,
    secondary: AppPalette.secondary,

    surface: AppPalette.lightSurface,
    error: AppPalette.error,

    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: AppPalette.textPrimary,
    onError: Colors.white,

    outline: AppPalette.border,

    surfaceContainer: const Color(0xFFF3F4F6),
    surfaceContainerHighest: const Color(0xFFE5E7EB),
  );

  //Dark theme
  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppPalette.primary,
    brightness: Brightness.dark,

    primary: AppPalette.primary,
    secondary: AppPalette.secondary,

    surface: AppPalette.darkSurface,
    error: AppPalette.error,

    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onError: Colors.white,

    outline: const Color(0xFF2A2F3A),

    surfaceContainer: const Color(0xFF1E293B),
    surfaceContainerHighest: const Color(0xFF334155),
  );
}
