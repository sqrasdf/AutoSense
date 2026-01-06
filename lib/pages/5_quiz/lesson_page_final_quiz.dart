import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
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
                correctAnswerClicked: correctAnswerClicked[0],
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
              const SizedBox(height: 30),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Jest noc i gęsta mgła. Kamera widzi tylko białą plamę, ale LIDAR wykrywa obiekt stały 30 metrów przed pojazdem. Radar potwierdza, że obiekt się nie porusza. Jaką decyzję podejmie system fuzji sensorów?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ScenarioOptionWidget(
                optionText:
                    "A: Zignorować odczyt LIDAR-u (kamera ma priorytet, a obraz jest pusty)",
                index: 1,
                correctAnswerClicked: correctAnswerClicked[1],
              ),
              ScenarioOptionWidget(
                optionText:
                    "B: Uznać obiekt za rzeczywistą przeszkodę i natychmiast rozpocząć hamowanie (zasada ograniczonego zaufania do wizji)",
                index: 1,
                onCorrectAnswer: onCorrectAnswer,
                isCorrect: true,
              ),
              ScenarioOptionWidget(
                optionText:
                    "C: Wyłączyć systemy autonomiczne i poprosić kierowcę o przejęcie kontroli bez hamowania",
                correctAnswerClicked: correctAnswerClicked[1],
                index: 1,
              ),
              const SizedBox(height: 30),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Auto autonomiczne (Poziom 4) jedzie pasem w korku. Mikrofony kierunkowe wykrywają sygnał syreny (ambulanse) z tyłu po lewej stronie. Kamera boczna jeszcze go nie widzi. Co powinno zrobić AI?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ScenarioOptionWidget(
                optionText:
                    "A: Czekać, aż ambulans pojawi się w polu widzenia kamery",
                index: 2,
                correctAnswerClicked: correctAnswerClicked[2],
              ),
              ScenarioOptionWidget(
                optionText:
                    "B: Przeanalizować mapę, aby znaleźć miejsce do zjechania na bok i powoli przygotowuje korytarz życia, zanim ambulans dojedzi",
                index: 2,
                onCorrectAnswer: onCorrectAnswer,
                isCorrect: true,
              ),
              ScenarioOptionWidget(
                optionText:
                    "C: Przyspieszyć, aby uciec przed ambulansem i nie blokować drogi",
                correctAnswerClicked: correctAnswerClicked[2],
                index: 2,
              ),
              const SizedBox(height: 30),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Auto jedzie z prędkością v = 70km/h na mokrej nawierzchni. Nagle na drogę wyskakuje zwierzę. System musi obliczyć drogę hamowania d. Jeśli współczynnik przyczepności spadł o 40%, co zrobi algorytm bezpieczeństwa?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ScenarioOptionWidget(
                optionText: "A: Zastosuje standardową siłę hamowania",
                index: 3,
                correctAnswerClicked: correctAnswerClicked[3],
              ),
              ScenarioOptionWidget(
                optionText:
                    "B: Zwiększy siłę hamowania pulsacyjnie (ABS) i przygotuje manewr omijania, jeśli droga d przekroczy dystans do przeszkody",
                index: 3,
                onCorrectAnswer: onCorrectAnswer,
                isCorrect: true,
              ),
              ScenarioOptionWidget(
                optionText: "C: Wyłączy silnik, aby zredukować prędkość",
                correctAnswerClicked: correctAnswerClicked[3],
                index: 3,
              ),
              const SizedBox(height: 30),

              const LessonNavigationButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
