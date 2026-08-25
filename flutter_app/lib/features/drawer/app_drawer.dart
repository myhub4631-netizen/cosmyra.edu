import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header - Profile Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.borderLight)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.primaryLight.withOpacity(0.2),
                    child: const Text('🎓', style: TextStyle(fontSize: 24)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Arjun Kumar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'arjun@example.com',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.edit_outlined, size: 18, color: AppColors.textSecondary),
                ],
              ),
            ),

            // Active Plan Status Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F7FF),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFDDD6FE)),
              ),
              child: Row(
                children: [
                  const Text('👑', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You're on Pro Plan",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'Valid till 20 May 2025',
                          style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 20, color: AppColors.primary),
                ],
              ),
            ),

            // Scrollable Menu Options
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  _buildSectionHeader('STUDY'),
                  _buildDrawerItem(Icons.home_outlined, 'Home', isSelected: true),
                  _buildDrawerItem(Icons.auto_awesome_outlined, 'Paper Prediction'),
                  _buildDrawerItem(Icons.psychology_outlined, 'Practice'),
                  _buildDrawerItem(Icons.assignment_outlined, 'Tests'),
                  _buildDrawerItem(Icons.history_outlined, 'Previous Attempts'),
                  _buildDrawerItem(Icons.insights_outlined, 'Performance'),
                  _buildDrawerItem(Icons.bar_chart_outlined, 'Analytics'),
                  _buildDrawerItem(Icons.bookmark_border_outlined, 'Bookmarks'),

                  const Divider(height: 24),
                  _buildSectionHeader('ACCOUNT'),
                  _buildDrawerItem(Icons.person_outline, 'My Profile'),
                  _buildDrawerItem(Icons.star_border, 'My Plan'),
                  _buildDrawerItem(Icons.account_balance_wallet_outlined, 'Wallet'),

                  const Divider(height: 24),
                  _buildSectionHeader('SUPPORT'),
                  _buildDrawerItem(Icons.help_outline, 'Help Center'),
                  _buildDrawerItem(Icons.support_agent_outlined, 'Contact Us'),

                  const Divider(height: 24),
                  _buildDrawerItem(Icons.logout, 'Logout', textColor: Colors.red),
                ],
              ),
            ),

            // App Version Footer
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Cosmyra App Version 2.4.1',
                style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 8, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          color: AppColors.textSecondary,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title, {
    bool isSelected = false,
    Color? textColor,
  }) {
    return ListTile(
      dense: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: isSelected ? const Color(0xFFF5F3FF) : Colors.transparent,
      leading: Icon(
        icon,
        size: 20,
        color: isSelected ? AppColors.primary : (textColor ?? AppColors.textPrimary),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
          color: isSelected ? AppColors.primary : (textColor ?? AppColors.textPrimary),
        ),
      ),
      onTap: () {},
    );
  }
}
