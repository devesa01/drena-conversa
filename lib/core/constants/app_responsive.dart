import 'package:flutter/material.dart';

/// Breakpoints baseados na largura do ecrã
/// Mobile:  < 600px
/// Tablet:  600px – 1024px
/// Desktop: > 1024px

class Responsive {
  Responsive._();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  /// Devolve um valor diferente consoante o ecrã
  /// Uso: Responsive.value(context, mobile: 16, tablet: 24, desktop: 32)
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }
}