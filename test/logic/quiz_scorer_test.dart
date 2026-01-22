import 'package:flutter_test/flutter_test.dart';
import 'package:autosense/logic/quiz_scorer.dart';

void main() {
  group('QuizScorer', () {
    final scorer = QuizScorer();

    test('calculateScore returns correct percentage', () {
      expect(scorer.calculateScore(5, 10), 0.5);
      expect(scorer.calculateScore(10, 10), 1.0);
      expect(scorer.calculateScore(0, 5), 0.0);
    });

    test('calculateScore throws ArgumentError for invalid inputs', () {
      expect(() => scorer.calculateScore(-1, 10), throwsArgumentError);
      expect(() => scorer.calculateScore(11, 10), throwsArgumentError);
      expect(() => scorer.calculateScore(5, 0), throwsArgumentError);
    });

    test('isPassed returns correct boolean based on threshold', () {
      expect(scorer.isPassed(0.8, 0.7), isTrue);
      expect(scorer.isPassed(0.6, 0.7), isFalse);
      expect(scorer.isPassed(0.7, 0.7), isTrue);
    });
  });
}
