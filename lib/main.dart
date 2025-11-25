import 'package:flutter/material.dart';
import 'package:safar_buddy/ui/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafarBuddy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
      home: const SplashScreen(),
    );
  }
}