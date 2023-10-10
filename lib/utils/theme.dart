import 'package:flutter/material.dart';
import 'package:flutter_viacep/utils/colors.dart';
import 'package:flutter_viacep/utils/no_transition_screen.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
      primarySwatch: AppColors.colorPrimarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        titleTextStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold),
      ),
      textTheme: _buildTextTheme(),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: NoTransitionsScreen(),
          TargetPlatform.iOS: NoTransitionsScreen(),
        },
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ));

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 38.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      titleMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      titleSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
