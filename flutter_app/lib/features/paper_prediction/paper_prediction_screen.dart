import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class PaperPredictionScreen extends StatelessWidget {
  final VoidCallback onOpenDrawer;

  const PaperPredictionScreen({Key? key, required this.onOpenDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onOpenDrawer,
        ),
        title: const Text('Paper Prediction'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Filter Pills Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSubjectPill('All', isSelected: true),
                  _buildSubjectPill('Physics'),
                  _buildSubjectPill('Chemistry'),
                  _buildSubjectPill('Biology'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Prediction Set 1
            _buildPredictionSetCard(
              title: 'NEET 2026 Paper Prediction Set - 1',
              isLatest: true,
              questions: 180,
              marks: 540,
              duration: '3:20 Hrs',
            ),
            const SizedBox(height: 12),

            // Prediction Set 2
            _buildPredictionSetCard(
              title: 'NEET 2026 Paper Prediction Set - 2',
              isLatest: false,
              questions: 180,
              marks: 540,
              duration: '3:20 Hrs',
            ),
            const SizedBox(height: 12),

            // Prediction Set 3
            _buildPredictionSetCard(
              title: 'NEET 2026 Paper Prediction Set - 3',
              isLatest: false,
              questions: 180,
              marks: 540,
              duration: '3:20 Hrs',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectPill(String title, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderLight),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildPredictionSetCard({
    required String title,
    required bool isLatest,
    required int questions,
    required int marks,
    required String duration,
  }) {
    return Container(
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
              if (isLatest)
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
              const Icon(Icons.chevron_right, size: 20, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            '📄 $questions Questions  •  🏆 $marks Marks  •  ⏱️ $duration',
            style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('📖 Practice'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  onPressed: () {},
                  child: const Text('📋 Start as Test', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
