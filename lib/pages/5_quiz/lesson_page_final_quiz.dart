import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/scenario_option_widget.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageFinalQuiz extends StatefulWidget {
  const LessonPageFinalQuiz({super.key});

  @override
  State<LessonPageFinalQuiz> createState() => LessonPageFinalQuizState();
}

class LessonPageFinalQuizState extends State<LessonPageFinalQuiz> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 14;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_checkScrollCompletion);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollCompletion);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _checkScrollCompletion() async {
    if (!_scrollController.hasClients) return;

    final double maxScroll = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.offset;

    if (maxScroll > 0) {
      final double scrollProgress = currentScroll / maxScroll;

      if (scrollProgress >= _completionThreshold && !_isLessonCompleted) {
        setState(() {
          _isLessonCompleted = true;
        });

        await saveLessonCompletionByIndex(lessonNumber - 1, 13);

        _scrollController.removeListener(_checkScrollCompletion);

        debugPrint('LEKCJA $lessonNumber UKOŃCZONA!');
      }
    }
  }

  List<bool> correctAnswerClicked = [false, false, false, false];

  void onCorrectAnswer(int index) {
    setState(() {
      correctAnswerClicked[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 25;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LessonTitlePanel(
                title: "Symulacja sytuacji drogowej",
                lessonNumber: lessonNumber,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Auto zbliża się do przejścia dla pieszych. Na chodniku stoi osoba patrząca w telefon, zwrócona tyłem do jezdni, ale blisko krawężnika. Jak powinien zareagować algorytm predykcji AI?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ScenarioOptionWidget(
                optionText: "A: Kontynuować jazdę z tą samą prędkością",
                index: 0,
                correctAnswerClicked: correctAnswerClicked[1],
              ),
              ScenarioOptionWidget(
                optionText: "B: Zwolnić i przygotować system hamowania",
                index: 0,
                onCorrectAnswer: onCorrectAnswer,
                isCorrect: true,
              ),
              ScenarioOptionWidget(
                optionText:
                    "C: Użyć sygnału dźwiękowego i przyspieszyć, aby szybciej opuścić strefę zagrożenia",
                correctAnswerClicked: correctAnswerClicked[0],

                index: 0,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
