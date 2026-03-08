import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  // Spacing
  static const double spacingXS = 8.0;
  static const double spacingS = 16.0;
  static const double spacingM = 24.0;
  static const double spacingL = 32.0;
  static const double spacingXL = 48.0;

  // Screen padding por plataforma
  static const double screenPaddingMobile = 16.0;
  static const double screenPaddingTablet = 48.0;
  static const double screenPaddingDesktop = 80.0;

  // Largura máxima do form (para não esticar em tablet/desktop)
  static const double formMaxWidthMobile = double.infinity;
  static const double formMaxWidthTablet = 480.0;
  static const double formMaxWidthDesktop = 420.0;

  // Badge
  static const double badgePaddingX = 10.0;
  static const double badgePaddingY = 3.0;
  static const double badgeFontSize = 14.0;   
  static const FontWeight badgeFontWeight = FontWeight.w500;
  static const double badgeBorderRadius = 20.0;

  // Input
  static const double inputBorderRadius = 10.0;

  // Button
  static const double buttonBorderRadius = 20.0;
  static const double buttonBorderWidth = 1.5;
}