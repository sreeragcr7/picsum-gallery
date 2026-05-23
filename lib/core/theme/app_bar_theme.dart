import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/theme/app_pallet.dart';

class TAppBarTheme {
  TAppBarTheme._();

  // Light theme
  static final AppBarTheme lightAppBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,

    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,

    foregroundColor: AppPalette.textPrimary,

    iconTheme: const IconThemeData(color: AppPalette.textPrimary, size: 22),

    titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppPalette.textPrimary),
  );

  // Dark theme
  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,

    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,

    foregroundColor: Colors.white,

    iconTheme: const IconThemeData(color: Colors.white, size: 22),

    titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
