import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List<Color> shades = [
      color.withOpacity(0.1),
      color.withOpacity(0.2),
      color.withOpacity(0.3),
      color.withOpacity(0.4),
      color.withOpacity(0.5),
      color.withOpacity(0.6),
      color.withOpacity(0.7),
      color.withOpacity(0.8),
      color.withOpacity(0.9),
      color,
    ];

    return MaterialColor(color.value, {
      50: shades[0],
      100: shades[1],
      200: shades[2],
      300: shades[3],
      400: shades[4],
      500: shades[5],
      600: shades[6],
      700: shades[7],
      800: shades[8],
      900: shades[9],
    });
  }

  static MaterialColor colorPrimarySwatch = createMaterialColor(primaryColor);

  static const Color primaryColor = Color(0XFF053d6b);
  static const Color secondaryColor = Color(0XFFFFD400);
  static const Color colorBackground = Color(0xFFf5f3f0);
}
