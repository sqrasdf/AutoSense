class QuizScorer {
  /// Oblicza wynik procentowy (0.0 - 1.0) na podstawie liczby poprawnych odpowiedzi.
  double calculateScore(int correctAnswers, int totalQuestions) {
    if (totalQuestions <= 0) {
      throw ArgumentError('Total questions must be greater than zero.');
    }
    if (correctAnswers < 0) {
      throw ArgumentError('Correct answers cannot be negative.');
    }
    if (correctAnswers > totalQuestions) {
      throw ArgumentError('Correct answers cannot exceed total questions.');
    }

    return correctAnswers / totalQuestions;
  }

  /// Sprawdza, czy wynik spełnia próg zaliczenia.
  bool isPassed(double score, double threshold) {
    return score >= threshold;
  }
}
