import 'package:flutter/material.dart';
import 'package:picsum_gallery/core/theme/app_bar_theme.dart';
import 'package:picsum_gallery/core/theme/button_theme.dart';
import 'package:picsum_gallery/core/theme/card_theme.dart';
import 'package:picsum_gallery/core/theme/color_scheme.dart';
import 'package:picsum_gallery/core/theme/input_theme.dart';
import 'package:picsum_gallery/core/theme/text_theme.dart';

class AppTheme {
  //Light theme
  static ThemeData get lightTheme {
    final colorScheme = AppColorScheme.lightColorScheme;
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTextTheme.lightTextTheme,
      cardTheme: AppCardTheme.lightCardTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textButtonTheme: AppButtonTheme.textButtonTheme,
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
      inputDecorationTheme: AppInputTheme.lightInputDecorationTheme,
    );
  }

  //Dark theme
  static ThemeData get darkTheme {
    final colorScheme = AppColorScheme.darkColorScheme;
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTextTheme.darkTextTheme,
      cardTheme: AppCardTheme.darkCardTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textButtonTheme: AppButtonTheme.textButtonTheme,
      elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
      inputDecorationTheme: AppInputTheme.darkInputDecorationTheme,
    );
  }
}
