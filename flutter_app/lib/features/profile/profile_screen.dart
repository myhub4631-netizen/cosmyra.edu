import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onOpenDrawer;

  const ProfileScreen({Key? key, required this.onOpenDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onOpenDrawer,
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Gradient Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: AppColors.profileGradient,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    child: const Text('👦', style: TextStyle(fontSize: 28)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rohit Sharma 🎓',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 2),
                        Text('rohitsharma22@gmail.com', style: TextStyle(color: Color(0xFFDDD6FE), fontSize: 11)),
                        Text('+91 98765 43210 • New Delhi', style: TextStyle(color: Color(0xFFDDD6FE), fontSize: 11)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.white70),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Streak Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F7FF),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFDDD6FE)),
              ),
              child: Row(
                children: [
                  const Text('👑', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You're on a 7 day streak! 🔥", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Text('Keep it up and reach your goals.', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('View Streak', style: TextStyle(fontSize: 11)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Account Settings List
            const Text(
              'ACCOUNT',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.textSecondary, letterSpacing: 1.0),
            ),
            const SizedBox(height: 8),

            _buildSettingTile(Icons.person_outline, 'Edit Profile', 'Update personal information'),
            _buildSettingTile(Icons.star_border, 'My Plan', 'Active • Pro Plan'),
            _buildSettingTile(Icons.center_focus_strong, 'Study Goal', 'NEET 2026 • 320 Days Left'),
            _buildSettingTile(Icons.tune, 'Preferences', 'App settings & notifications'),
            _buildSettingTile(Icons.security, 'Privacy & Security', 'Manage security & login'),

            const SizedBox(height: 16),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFF1F2),
                  foregroundColor: Colors.red,
                  elevation: 0,
                  side: const BorderSide(color: Color(0xFFFECDD3)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout, size: 18),
                label: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 18, color: AppColors.primary),
      ),
      title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
      trailing: const Icon(Icons.chevron_right, size: 18, color: AppColors.textSecondary),
    );
  }
}
