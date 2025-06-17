// lib/core/styles/font_families.dart
import 'package:flutter/material.dart';

class FontFamilies {
  // Singleton pattern (optional but recommended for constants)
  FontFamilies._();
  static final instance = FontFamilies._();

  // Font families
  static const String lato = 'Lato';
  static const String interDisplay = 'InterDisplay';

  // Font weight constants (for better readability)
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

// Alternative: Extension for quick access
extension FontFamilyExtensions on TextStyle {
  TextStyle get lato => copyWith(fontFamily: FontFamilies.lato);
  TextStyle get interDisplay => copyWith(fontFamily: FontFamilies.interDisplay);
}