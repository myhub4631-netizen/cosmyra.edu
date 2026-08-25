import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AnalyticsScreen extends StatelessWidget {
  final VoidCallback onOpenDrawer;

  const AnalyticsScreen({Key? key, required this.onOpenDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onOpenDrawer,
        ),
        title: const Text('Analytics'),
        actions: [
          IconButton(icon: const Icon(Icons.calendar_month), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rainbow Speed Gauge Hero Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2E1065), Color(0xFF3B0764), Color(0xFF4C1D95)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Overall Performance',
                            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'Keep practicing to achieve your goal!',
                            style: TextStyle(color: Color(0xFFDDD6FE), fontSize: 11),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text('↑ 12%', style: TextStyle(color: Color(0xFF6EE7B7), fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Center Arc Score
                  Center(
                    child: Column(
                      children: const [
                        Text(
                          '72%',
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'OVERALL SCORE',
                          style: TextStyle(color: Color(0xFFDDD6FE), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Performance by Difficulty Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Performance by Difficulty',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 12),

                  _buildDifficultyRow('Easy', '82%', '(656)', Colors.green),
                  const SizedBox(height: 8),
                  _buildDifficultyRow('Medium', '71%', '(568)', Colors.amber),
                  const SizedBox(height: 8),
                  _buildDifficultyRow('Hard', '54%', '(432)', Colors.red),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 4 Metrics Grid Row
            Row(
              children: [
                Expanded(child: _buildMiniStat('Accuracy', '78%', '↑ 8%', Colors.green)),
                const SizedBox(width: 8),
                Expanded(child: _buildMiniStat('Attempted', '92%', '↑ 5%', Colors.purple)),
                const SizedBox(width: 8),
                Expanded(child: _buildMiniStat('Time/Q', '1m 24s', '↓ 10s', Colors.orange)),
                const SizedBox(width: 8),
                Expanded(child: _buildMiniStat('Speed', '45 Qs/h', '↑ 6 Qs', Colors.blue)),
              ],
            ),

            const SizedBox(height: 16),

            // Strength & Weakness 2-Column Box
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFBBF7D0)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Top Strengths', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF166534))),
                        SizedBox(height: 6),
                        Text('☑ Units & Meas.', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        Text('☑ Plant Physiol.', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        Text('☑ Thermodyn.', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1F2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFFECDD3)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Top Weakness', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF9F1239))),
                        SizedBox(height: 6),
                        Text('☒ Chem Bonding', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        Text('☒ Human Reprod.', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        Text('☒ Current Elect.', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyRow(String label, String percent, String count, MaterialColor color) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const Spacer(),
        Text(percent, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
        const SizedBox(width: 4),
        Text(count, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
      ],
    );
  }

  Widget _buildMiniStat(String title, String val, String trend, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Text(val, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
          const SizedBox(height: 2),
          Text(trend, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
