import 'package:drena_conversa/core/constants/app_colors.dart';
import 'package:drena_conversa/core/constants/app_dimentions.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    fontFamily: 'MadeTommy',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      ),
    ),
  );
}