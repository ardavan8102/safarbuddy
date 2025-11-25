import 'package:flutter/material.dart';
import 'package:safar_buddy/consts/app_theme.dart';
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
      theme: AppTheme.mainTheme,
      home: const SplashScreen(),
    );
  }
}