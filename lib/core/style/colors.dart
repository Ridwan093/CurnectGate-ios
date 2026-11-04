// lib/core/styles/colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Singleton pattern for efficient memory usage
  AppColors._();
  static final instance = AppColors._();

  // final Color appBar = Theme.of(context).scaffoldBackgroundColor;
  //BLACK COLOR    9013FE  Color(0xFF9013FE;
  final Color black600 = const Color(0xFF1C1C1C);
  final Color black500 = const Color(0xFF494949);
  final Color black400 = const Color(0xFF777777);
  final Color black300 = const Color(0xFFA4A4A4);
  final Color black200 = const Color(0xFFbbbbbb);
  final Color black100 = const Color(0xFFD2D2D2);

  final Color random = const Color(0xFFF6F5ED);

  ///YELLOW COLOR
  final Color yellow600 = const Color(0xFFCCA300);
  final Color yellow500 = const Color(0xFFFFCC00);
  final Color yellow400 = const Color(0xFFFBEB93);
  final Color yellow300 = const Color(0xFFFDF2D7);
  final Color yellow200 = const Color(0xFFFDF5C9);
  final Color yellow100 = const Color(0xFFFEFcED);

  ///TEAL COLOR
  final Color teal500 = const Color(0xFF398065);
  final Color teal400 = const Color(0xFF5B7F85);
  final Color teal300 = const Color(0xFF8EC0C9);
  final Color teal200 = const Color(0xFFBBD9DF);
  final Color teal100 = const Color(0xFFE8F2F4);

  ///ERROR RED*******

  final Color error700 = const Color(0xFFC83737);
  final Color error600 = const Color(0xFFEF4444);
  final Color error500 = const Color(0xFFF87171);
  final Color error400 = const Color(0xFFFCA5A5);

  final Color error300 = const Color(0xFFFECACA);
  final Color error200 = const Color(0xFFFEE2E2);
  final Color error100 = const Color(0xFFFEF2F2);

  ///BLUE COLORE
  final Color blue600 = const Color(0xFF2752AE);
  final Color blue500 = const Color(0xFF3166DA);
  final Color blue400 = const Color(0xFF5A85E1);
  final Color blue300 = const Color(0xFF83A3E9);
  final Color blue200 = const Color(0xFFC1D1F4);
  final Color blue100 = const Color(0xFFEAF0FB);

  ///GRAY COLOR
  final Color grey500 = const Color(0xFFD2D2D2);
  final Color grey400 = const Color(0xFFDBDBDB);
  final Color grey300 = const Color(0xFFF1F1F1);
  final Color grey200 = const Color(0xFFF9F9F9);
}
