import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/practice/custom_practice_screen.dart';

void main() {
  runApp(const CosmyraApp());
}

class CosmyraApp extends StatelessWidget {
  const CosmyraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmyra NEET/JEE Exam Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const CustomPracticeScreen(),
    );
  }
}
