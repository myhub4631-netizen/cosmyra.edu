import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../models/question.dart';

class CustomPracticeScreen extends StatefulWidget {
  const CustomPracticeScreen({Key? key}) : super(key: key);

  @override
  State<CustomPracticeScreen> createState() => _CustomPracticeScreenState();
}

class _CustomPracticeScreenState extends State<CustomPracticeScreen> {
  int _currentIndex = 0;
  String? _selectedOptionId;

  final List<Question> _questions = [
    Question(
      id: 'q1',
      examId: 'e1',
      subjectId: 's1',
      chapterId: 'c1',
      questionText: 'A block of mass m = 5 kg rests on a surface with static friction coefficient \\mu_s = 0.4. Find minimum force F to move it.',
      qType: 'single_correct',
      difficulty: 'medium',
      source: 'pyq',
      explanation: 'Limiting static friction is f_s = \\mu_s m g = 0.4 \\times 5 \\times 10 = 20 N.',
      solution: 'F_{\\text{min}} = 20\\text{ N}.',
      marks: 4.0,
      negativeMarks: 1.0,
      year: 2024,
      options: [
        QuestionOption(id: 'opt1', questionId: 'q1', optionIndex: 0, optionText: '10 N', isCorrect: false),
        QuestionOption(id: 'opt2', questionId: 'q1', optionIndex: 1, optionText: '15 N', isCorrect: false),
        QuestionOption(id: 'opt3', questionId: 'q1', optionIndex: 2, optionText: '20 N', isCorrect: true),
        QuestionOption(id: 'opt4', questionId: 'q1', optionIndex: 3, optionText: '25 N', isCorrect: false),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Practice (${_currentIndex + 1}/${_questions.length})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Question Bookmarked!')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Difficulty Tag
            Chip(
              label: Text(question.difficulty.toUpperCase()),
              backgroundColor: Colors.blue.withOpacity(0.2),
              labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 12),
            ),
            const SizedBox(height: 12),

            // Question Text / TeX
            Text(
              question.questionText,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Options list
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final option = question.options[index];
                  final isSelected = _selectedOptionId == option.id;
                  final isAnswered = _selectedOptionId != null;

                  Color borderCol = const Color(0xFF1E293B);
                  Color bgCol = const Color(0xFF131B2E);

                  if (isAnswered) {
                    if (option.isCorrect) {
                      borderCol = Colors.green;
                      bgCol = Colors.green.withOpacity(0.1);
                    } else if (isSelected && !option.isCorrect) {
                      borderCol = Colors.red;
                      bgCol = Colors.red.withOpacity(0.1);
                    }
                  }

                  return GestureDetector(
                    onTap: isAnswered
                        ? null
                        : () {
                            setState(() {
                              _selectedOptionId = option.id;
                            });
                          },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: bgCol,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderCol),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: const Color(0xFF1E293B),
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              option.optionText,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Immediate Solution Drawer
            if (_selectedOptionId != null)
              Container(
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Explanation & Solution:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                    const SizedBox(height: 4),
                    Text(question.explanation ?? '', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentIndex < _questions.length - 1
                      ? () {
                          setState(() {
                            _currentIndex++;
                            _selectedOptionId = null;
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
