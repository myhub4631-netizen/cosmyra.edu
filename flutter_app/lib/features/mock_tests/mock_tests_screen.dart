import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/models.dart';

class MockTestsScreen extends StatelessWidget {
  final VoidCallback onOpenDrawer;

  const MockTestsScreen({Key? key, required this.onOpenDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tests = [
      MockTestData(
        id: '1',
        title: 'NEET 2024 Full Length Mock Test - 8',
        date: '18 May 2024',
        type: 'Full Test',
        questions: 180,
        marks: 720,
        duration: '3:20 Hrs',
      ),
      MockTestData(
        id: '2',
        title: 'NEET 2024 Physics Sprint Test - 5',
        date: '12 May 2024',
        type: 'Subject Test',
        questions: 45,
        marks: 180,
        duration: '1:00 Hr',
      ),
      MockTestData(
        id: '3',
        title: 'NEET 2024 Chemistry Chapter Test - 3',
        date: '05 May 2024',
        type: 'Chapter Test',
        questions: 30,
        marks: 120,
        duration: '45 Mins',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onOpenDrawer,
        ),
        title: const Text('Mock Tests'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E1065), Color(0xFF4C1D95), Color(0xFF5D3EED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Assess Yourself. Improve Every Day.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Take full length mock tests designed exactly as per NTA pattern.',
                    style: TextStyle(
                      color: Color(0xFFDDD6FE),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, size: 16),
                    label: const Text('Take a Test', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 4 Metrics Cards Row
            Row(
              children: [
                Expanded(child: _buildMetricMiniCard('Tests Taken', '32', Icons.assignment, Colors.blue)),
                const SizedBox(width: 8),
                Expanded(child: _buildMetricMiniCard('Avg. Score', '78%', Icons.center_focus_strong, Colors.orange)),
                const SizedBox(width: 8),
                Expanded(child: _buildMetricMiniCard('Best Score', '1280', Icons.trending_up, Colors.emerald)),
              ],
            ),

            const SizedBox(height: 20),

            // Test List Stack
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available Mock Tests',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Filter ∨')),
              ],
            ),
            const SizedBox(height: 8),

            ...tests.map((test) => _buildTestCard(test)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricMiniCard(String title, String val, IconData icon, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(val, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13)),
          Text(title, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildTestCard(MockTestData test) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'LATEST',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF10B981)),
                ),
              ),
              const Icon(Icons.bookmark_border, size: 20, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            test.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            '📄 ${test.questions} Questions  •  🏆 ${test.marks} Marks  •  ⏱️ ${test.duration}',
            style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Preview'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  onPressed: () {},
                  child: const Text('Start Test', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
