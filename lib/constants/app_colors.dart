import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFE3350D);
  static const Color secondaryColorBlue = Color(0xFF1A6FBB);
  static const Color secondaryColorYellow = Color(0xFFF5C518);
  static const Color secondaryColorGreen = Color(0xFF4CAF50);
  static const Color accentColorOrange = Color(0xFFFF8C00);
  static const Color backgroundColor = Color(0xFFF2F2F2);

  static const MaterialColor primarySwatch =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFFFF3F0),
    100: Color(0xFFFFE2D9),
    200: Color(0xFFFDCCBF),
    300: Color(0xFFFBB5A4),
    400: Color(0xFFFA9D8A),
    500: Color(_primaryValue),
    600: Color(0xFFE22509),
    700: Color(0xFFD11F07),
    800: Color(0xFFC01A05),
    900: Color(0xFFA11203),
  });

  static const int _primaryValue = 0xFFE3350D;
}
