import 'package:flutter/foundation.dart';
import '../../models/models.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://uhfzbuebbgzoiygwjvex.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVoZnpidWViYmd6b2l5Z3dqdmV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODc2NTAwMTgsImV4cCI6MjEwMzIyNjAxOH0.MFDOO7J4TAXn_-7MuW-_Ss2Tf1ihcQgPKpZpbRJzixI';

  static List<QuestionModel> getSampleQuestions() {
    return [
      QuestionModel(
        id: 'd1111111-1111-1111-1111-111111111111',
        examId: '11111111-1111-1111-1111-111111111111',
        subjectId: 'a1111111-1111-1111-1111-111111111111',
        chapterId: 'b1111111-1111-1111-1111-111111111111',
        questionText: r'A block of mass m = 5 kg rests on a rough horizontal surface with coefficient of static friction \mu_s = 0.4. What is the minimum horizontal force F required to initiate motion? (Take g = 10 m/s^2)',
        qType: 'single_correct',
        difficulty: 'medium',
        source: 'pyq',
        marks: 4.0,
        negativeMarks: 1.0,
        year: 2024,
        explanation: r'Limiting static friction is given by f_s = \mu_s N = \mu_s m g.',
        solution: r'f_s = 0.4 \times 5 \times 10 = 20 N. Minimum horizontal force F_{min} = 20 N.',
        options: [
          QuestionOptionModel(id: 'opt1', questionId: 'd1', optionIndex: 0, optionText: '10 N', isCorrect: false),
          QuestionOptionModel(id: 'opt2', questionId: 'd1', optionIndex: 1, optionText: '15 N', isCorrect: false),
          QuestionOptionModel(id: 'opt3', questionId: 'd1', optionIndex: 2, optionText: '20 N', isCorrect: true),
          QuestionOptionModel(id: 'opt4', questionId: 'd1', optionIndex: 3, optionText: '25 N', isCorrect: false),
        ],
      ),
      QuestionModel(
        id: 'd2222222-2222-2222-2222-222222222222',
        examId: '11111111-1111-1111-1111-111111111111',
        subjectId: 'a2222222-2222-2222-2222-222222222222',
        chapterId: 'b3333333-3333-3333-3333-333333333333',
        questionText: 'Which of the following alkanes gives only one monochloro derivative upon photochemical chlorination?',
        qType: 'single_correct',
        difficulty: 'easy',
        source: 'nta',
        marks: 4.0,
        negativeMarks: 1.0,
        year: 2025,
        explanation: 'Neopentane possesses 12 equivalent hydrogens, yielding a single monochloro product.',
        solution: 'Structure of Neopentane: (CH3)4C. All hydrogen atoms are chemically equivalent.',
        options: [
          QuestionOptionModel(id: 'opt21', questionId: 'd2', optionIndex: 0, optionText: 'n-Pentane', isCorrect: false),
          QuestionOptionModel(id: 'opt22', questionId: 'd2', optionIndex: 1, optionText: 'Isopentane', isCorrect: false),
          QuestionOptionModel(id: 'opt23', questionId: 'd2', optionIndex: 2, optionText: 'Neopentane', isCorrect: true),
          QuestionOptionModel(id: 'opt24', questionId: 'd2', optionIndex: 3, optionText: '2-Methylbutane', isCorrect: false),
        ],
      ),
      QuestionModel(
        id: 'd3333333-3333-3333-3333-333333333333',
        examId: '11111111-1111-1111-1111-111111111111',
        subjectId: 'a3333333-3333-3333-3333-333333333333',
        chapterId: 'b4444444-4444-4444-4444-444444444444',
        questionText: 'Parietal cells (Oxyntic cells) in the gastric mucosa of human stomach secrete:',
        qType: 'single_correct',
        difficulty: 'easy',
        source: 'pyq',
        marks: 4.0,
        negativeMarks: 1.0,
        year: 2023,
        explanation: 'Oxyntic cells secrete HCl and Castle Intrinsic Factor (vital for Vitamin B12 absorption).',
        solution: 'Pepsinogen is secreted by Chief cells. HCl is secreted by Oxyntic/Parietal cells.',
        options: [
          QuestionOptionModel(id: 'opt31', questionId: 'd3', optionIndex: 0, optionText: 'Pepsinogen and Mucus', isCorrect: false),
          QuestionOptionModel(id: 'opt32', questionId: 'd3', optionIndex: 1, optionText: 'HCl and Intrinsic Factor', isCorrect: true),
          QuestionOptionModel(id: 'opt33', questionId: 'd3', optionIndex: 2, optionText: 'Trypsinogen and Amylase', isCorrect: false),
          QuestionOptionModel(id: 'opt34', questionId: 'd3', optionIndex: 3, optionText: 'Gastrin and Secretin', isCorrect: false),
        ],
      ),
    ];
  }
}
