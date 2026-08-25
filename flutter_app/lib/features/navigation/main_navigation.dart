import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../webview/app_webview_screen.dart';
import '../drawer/app_drawer.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> _tabRoutes = [
    {
      'title': 'Dashboard',
      'url': 'https://cosmyra-app.vercel.app/app/dashboard',
    },
    {
      'title': 'Practice',
      'url': 'https://cosmyra-app.vercel.app/app/practice',
    },
    {
      'title': 'Mock Tests',
      'url': 'https://cosmyra-app.vercel.app/app/tests',
    },
    {
      'title': 'Analytics',
      'url': 'https://cosmyra-app.vercel.app/app/analytics',
    },
    {
      'title': 'Profile',
      'url': 'https://cosmyra-app.vercel.app/app/profile',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabRoutes.map((tab) {
          return AppWebViewScreen(
            initialUrl: tab['url']!,
            title: tab['title']!,
          );
        }).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0F172A),
        elevation: 8,
        indicatorColor: AppColors.primaryLight.withOpacity(0.3),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Color(0xFF94A3B8)),
            selectedIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.psychology_outlined, color: Color(0xFF94A3B8)),
            selectedIcon: Icon(Icons.psychology, color: Colors.white),
            label: 'Practice',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined, color: Color(0xFF94A3B8)),
            selectedIcon: Icon(Icons.assignment, color: Colors.white),
            label: 'Tests',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined, color: Color(0xFF94A3B8)),
            selectedIcon: Icon(Icons.bar_chart, color: Colors.white),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: Color(0xFF94A3B8)),
            selectedIcon: Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
