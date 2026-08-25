import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/navigation/main_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CosmyraApp());
}

class CosmyraApp extends StatelessWidget {
  const CosmyraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmyra NEET/JEE Exam Platform',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const MainNavigationScreen(),
    );
  }
}
