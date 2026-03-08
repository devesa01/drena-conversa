import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  static const String family = 'MadeTommy';

  // Pesos
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight extraBold = FontWeight.w800;

  // Estilos prontos a usar
  static const TextStyle title = TextStyle(
    fontFamily: family,
    fontWeight: extraBold,
    color: Colors.white,
    fontSize: 28,
  );

  static const TextStyle body = TextStyle(
    fontFamily: family,
    fontWeight: regular,
    color: Colors.white,
    fontSize: 16,
  );

  static const TextStyle error = TextStyle(
    fontFamily: family,
    fontWeight: thin,
    color: Colors.redAccent,
    fontSize: 12,
  );

  static const TextStyle label = TextStyle(
    fontFamily: family,
    fontWeight: regular,
    color: Colors.white70,
    fontSize: 14,
  );
}