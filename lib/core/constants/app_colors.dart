import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Background
  static const Color backgroundBase = Color(0xFF111111);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFF17161F), // origem rgba(23, 22, 31, 1)
      Color(0xFF161033), // destino rgba(22, 16, 51, 1)
    ],
  );

  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  // Input
  static const Color inputBorder = Colors.white54;
  static const Color inputBorderFocused = Colors.white;

  // Buttons — Primary (purple com 25% opacidade)
  static const Color buttonPrimaryBackground = Color(0x406C4FFF); // rgba(108, 79, 255, 0.25)
  static const Color buttonPrimaryBorder = Color(0xFF6C4FFF);
  static const Color buttonPrimaryText = Colors.white;

  // Buttons — Light (branco com 10% opacidade)
  static const Color buttonLightBackground = Color(0x1AFFFFFF); // rgba(255, 255, 255, 0.1)
  static const Color buttonLightBorder = Colors.white24;
  static const Color buttonLightText = Colors.white;

  // Badge
  static const Color badgeText = Colors.white;

  // Navigation
  static const Color navActive = Color(0xFF6C4FFF);
  static const Color navInactive = Colors.white38;
  static const Color navIndicator = Color(0x336C4FFF); // 20% opacidade
}