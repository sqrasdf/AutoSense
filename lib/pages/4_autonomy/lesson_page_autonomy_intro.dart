import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:autosense/pages/4_autonomy/lesson_page_levels_35.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageAutonomyIntro extends StatefulWidget {
  const LessonPageAutonomyIntro({super.key});

  @override
  State<LessonPageAutonomyIntro> createState() =>
      _LessonPageAutonomyLevels02State();
}

class _LessonPageAutonomyLevels02State extends State<LessonPageAutonomyIntro> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 11;

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
                title: "Poziomy Autonomii SAE (0-2) - Asysta Kierowcy",
                lessonNumber: lessonNumber,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),

              SectionTitle(
                title: "Wprowadzenie: dlaczego istnieją poziomy autonomii?",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Autonomia pojazdów to nie tylko „auto, które samo jedzie”. To skala określająca, kto jest odpowiedzialny za prowadzenie:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "kierowca,",
                "system wspomagania,",
                "czy pełna sztuczna inteligencja.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Aby ujednolicić definicje, amerykańska organizacja SAE stworzyła standard SAE J3016, opisujący ",
                  ),
                  const TextSpan(
                    text: "6 poziomów autonomii — od 0 do 5.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "To właśnie te poziomy określają:"),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "co auto potrafi,",
                "kiedy kierowca musi przejąć kontrolę,",
                "jak zachowuje się system w ruchu drogowym.",
              ]),
              const SizedBox(height: 20),

              SectionTitle(title: "Co wyróżnia poziomy 0-2?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Poziomy 0, 1 i 2 określane są jako:"),
                ],
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.arrow_forward,
                text: "„Asysta kierowcy” (Driver Assistance)",
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "System pomaga, ale nie prowadzi pojazdu samodzielnie. ",
                  ),
                  const TextSpan(
                    text:
                        "Kierowca zawsze jest odpowiedzialny i musi monitorować sytuację.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              SectionTitle(title: "Poziom 0 — Brak automatyzacji"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Auto nie podejmuje decyzji za kierowcę. Możą się pojawiać funkcje ostrzegawcze, ale nie sterujące.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykłady funkcji:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "ostrzeżenie o kolizji (bez automatycznego hamowania),",
                "sygnał o niezamierzonej zmianie pasa,",
                "kamera cofania, czujniki parkowania (bez sterowania kierownicą).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Kto prowadzi?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextIconWidget(
                icon: Icons.person_outline,
                text: "Kierowca w 100%.",
              ),

              const SizedBox(height: 20),

              SectionTitle(
                title:
                    "Poziom 1 — Wsparcie jednego zadania (np. kierowanie albo prędkość)",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(text: "System może kontrolować "),
                  const TextSpan(
                    text: "jedną funkcję jazdy naraz.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykłady:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Adaptive Cruise Control (ACC) - utrzymanie prędkości i odległości,",
                "Lane Keep Assist (LKA) - delikatne korekty toru jazdy.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Ograniczenia:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "auto nie prowadzi się samo,",
                "kierowca musi trzymać ręce na kierownicy i patrzeć na drogę.",
              ]),

              const SizedBox(height: 20),

              SectionTitle(
                title: "Poziom 2 — Asysta dwóch funkcji jednocześnie",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Tutaj system może wykonywać podwójne zadania, np.:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "sterować kierownicą,",
                "kontrolować prędkość i odległość,",
                "utrzymywać kierunek jazdy w pasie.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "To jest poziom, który mają aktualnie najpopularniejsze auta asystujące kierowcy.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykłady systemów poziomu 2:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Tesla Autopilot (podstawowy, nie FSD),",
                "Mercedes Distronic Plus,",
                "Autohold + Lane Centering w wielu autach 2020+.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Kto prowadzi?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextIconWidget(
                icon: Icons.person_outline,
                text:
                    "Wciąż kierowca! System tylko „pomaga”, nie podejmuje decyzji w imieniu kierowcy.",
              ),

              const SizedBox(height: 20),

              SectionTitle(title: "Podsumowanie lekcji"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [const TextSpan(text: "W poziomach 0-2:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "system nie jest autonomiczny,",
                "kierowca zawsze jest odpowiedzialny,",
                "systemy jedynie wspomagają,",
                "technologie koncentrują się na komforcie i bezpieczeństwie, a nie na samodzielnej jeździe.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W następnej lekcji przechodzimy do prawdziwej autonomii — poziomów 3, 4 i 5.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const LessonNavigationButtons(
                nextPageWidget: LessonPageLevels35(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
