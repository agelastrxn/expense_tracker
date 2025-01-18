import 'package:expense_tracker/app/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ButtonStyle filledButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(AppColors.primary),
    foregroundColor: WidgetStateProperty.all(Colors.white),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

  // Theme settings shared by both light and dark themes
  static ThemeData theme(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      filledButtonTheme: FilledButtonThemeData(style: filledButtonStyle),
      iconTheme: IconThemeData(color: AppColors.primary),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: brightness,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  static ThemeData lighTheme = theme(Brightness.light);
  static ThemeData darkTheme = theme(Brightness.dark);
}
