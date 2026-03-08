import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundBase,
        fontFamily: 'MadeTommy',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C4FFF),
          onPrimary: AppColors.textPrimary,
          surface: AppColors.backgroundBase,
          onSurface: AppColors.textPrimary,
        ),

        // Texto sempre branco
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textPrimary),
          bodySmall: TextStyle(color: AppColors.textSecondary),
          titleLarge: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: AppColors.textPrimary),
          labelLarge: TextStyle(color: AppColors.textPrimary),
        ),

        // Inputs
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: AppColors.textSecondary),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputBorder),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputBorderFocused),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
          errorStyle: TextStyle(color: Colors.redAccent),
        ),

        // Elevated button — Primary (purple)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonPrimaryBackground,
            foregroundColor: AppColors.buttonPrimaryText,
            side: const BorderSide(color: AppColors.buttonPrimaryBorder, width: AppDimensions.buttonBorderWidth),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
            ),
          ),
        ),

        // Outlined button — Light (branco)
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.buttonLightBackground,
            foregroundColor: AppColors.buttonLightText,
            side: const BorderSide(color: AppColors.buttonLightBorder, width: AppDimensions.buttonBorderWidth),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
            ),
          ),
        ),
      );
}