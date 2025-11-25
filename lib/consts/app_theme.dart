import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),

      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    fontFamily: 'Poppins',
  );

}