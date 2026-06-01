// app_pallet.dart

import 'package:flutter/material.dart';

class AppPalette {
  AppPalette._();

  // ===== Brand Colors =====
  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFFFFB703);
  static const Color accent = Color(0xFF00C896);

  // ===== Light Theme =====
  static const Color lightBackground = Color(0xFFF7F8FC);
  static const Color lightSurface = Colors.white;

  // ===== Dark Theme =====
  static const Color darkBackground = Color(0xFF0F1117);
  static const Color darkSurface = Color(0xFF1A1D26);

  // ===== Text =====
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  // ===== Status =====
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFFFB703);
  static const Color error = Color(0xFFFF5A5F);

  // ===== Misc =====
  static const Color border = Color(0xFFE5E7EB);
  static const Color shadow = Color(0x14000000);

  // ===== Gradient =====
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6C63FF), Color(0xFF5A36BE), Color(0xFF2B1068)],
  );
}
