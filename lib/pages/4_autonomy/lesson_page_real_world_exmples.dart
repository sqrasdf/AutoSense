import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/scenario_option_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/utils.dart';
import 'package:autosense/widgets/comparison_table.dart';
import 'package:flutter/material.dart';

class LessonPageRealWorldExamples extends StatefulWidget {
  const LessonPageRealWorldExamples({super.key});

  @override
  State<LessonPageRealWorldExamples> createState() =>
      _LessonPageRealWorldExamplesState();
}

class _LessonPageRealWorldExamplesState
    extends State<LessonPageRealWorldExamples> {
  Widget _buildRealWorldTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, width: 1.0),
      columnWidths: const {
        0: FlexColumnWidth(1.8),
        1: FlexColumnWidth(1.0),
        2: FlexColumnWidth(3.5),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            buildTableHeaderCell('Marka / System'),
            buildTableHeaderCell('Poziom SAE'),
            buildTableHeaderCell('Co potrafi?'),
          ],
        ),
        TableRow(
          children: [
            buildTableCell('Tesla FSD / Autopilot', isBold: true),
            buildTableCell('2'),
            buildTableCell('jazda częściowo autonomiczna, kierowca nadzoruje'),
          ],
        ),
        TableRow(
          children: [
            buildTableCell('Mercedes Drive Pilot', isBold: true),
            buildTableCell('3'),
            buildTableCell(
              'jazda autonomiczna w ograniczonych warunkach, bez nadzoru wzrokowego',
            ),
          ],
        ),
        TableRow(
          children: [
            buildTableCell('Waymo Robotaxi', isBold: true),
            buildTableCell('4'),
            buildTableCell(
              'pełna jazda autonomiczna bez kierowcy, w określonych strefach',
            ),
          ],
        ),
        TableRow(
          children: [
            buildTableCell('Brak przykładów', isBold: true),
            buildTableCell('5'),
            buildTableCell('poziom 5 nie istnieje jeszcze komercyjnie'),
          ],
        ),
      ],
    );
  }

  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 13;

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

  List<bool> correctAnswerClicked = [false, false, false];

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
                title:
                    "Przykłady realnych aut + Quiz „Jaki to poziom autonomii?”",
                lessonNumber: lessonNumber,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),

              SectionTitle(
                title: "Wprowadzenie: autonomia w prawdziwym świecie",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Choć wiele firm reklamuje swoje systemy jako „autopilota”, to faktyczne poziomy autonomii są ściśle zdefiniowane.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [const TextSpan(text: "W tej lekcji uporządkujemy:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "które systemy działają na poziomie 2,",
                "które osiągnęły przełomowy poziom 3,",
                "a które testują lub wdrażają poziom 4.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Poziomu 5 nie posiada jeszcze żaden pojazd dostępny na rynku.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title:
                    "Przykłady samochodów i firm — rzeczywiste poziomy autonomii",
              ),
              const SizedBox(height: 20),

              PointListWidget(
                title:
                    "Tesla — poziom 2 (Autopilot / FSD Beta / FSD Supervised)",
                description:
                    "Wymaga pełnego nadzoru kierowcy, trzymania rąk na kierownicy oraz interwencji w nieprzewidzianych sytuacjach. Odpowiedzialność pozostaje na kierowcy. Klasyfikacja to poziom 2 SAE.",
              ),
              const SizedBox(height: 16),

              PointListWidget(
                title: "Mercedes EQS/EQE — poziom 3 (Drive Pilot)",
                description:
                    "Mercedes jako pierwszy uzyskał oficjalną homologację poziomu 3 SAE w niektórych krajach. Umożliwia jazdę w korku na autostradzie bez konieczności patrzenia na drogę (do ok. 60 km/h). Jest to klasyczne „conditional automation”.",
              ),
              const SizedBox(height: 16),

              PointListWidget(
                title: "Waymo — poziom 4 (robotaxi bez kierowcy)",
                description:
                    "Obecnie najbardziej dojrzały system poziomu 4 dostępny komercyjnie. Cechuje go brak kierowcy w kabinie oraz pełny nadzór AI, ale działa tylko w wyznaczonych (zmapowanych) strefach miast. Poza strefą auto nie ruszy.",
              ),
              const SizedBox(height: 16),

              SectionTitle(title: "Podsumowanie przykładów"),
              const SizedBox(height: 20),
              _buildRealWorldTable(),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Interaktywny Quiz: „Jaki to poziom autonomii?”",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Sprawdź, czy potrafisz poprawnie zaklasyfikować poniższe scenariusze do odpowiedniego poziomu autonomii SAE.",
                  ),
                ],
              ),

              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "1. Auto jedzie samo na autostradzie, utrzymuje pas i prędkość. Kierowca musi trzymać ręce na kierownicy.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              ScenarioOptionWidget(
                optionText: "A) 1",
                index: 0,
                correctAnswerClicked: correctAnswerClicked[0],
              ),
              ScenarioOptionWidget(
                optionText: "B) 2",
                onCorrectAnswer: onCorrectAnswer,
                isCorrect: true,
                index: 0,
              ),
              ScenarioOptionWidget(
                optionText: "C) 3",
                correctAnswerClicked: correctAnswerClicked[0],
                index: 0,
              ),

              const SizedBox(height: 20),
              const LessonNavigationButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
