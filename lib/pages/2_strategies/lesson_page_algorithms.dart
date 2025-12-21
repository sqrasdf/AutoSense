import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/pages/2_strategies/lesson_page_examples.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageAlgorithms extends StatefulWidget {
  const LessonPageAlgorithms({super.key});

  @override
  State<LessonPageAlgorithms> createState() => _LessonPageDecisionMakingState();
}

class _LessonPageDecisionMakingState extends State<LessonPageAlgorithms> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 5;

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
                title: "Algorytmy Decyzyjne - Mózg Autonomii",
                lessonNumber: lessonNumber,
              ),
              const Divider(),
              const SizedBox(height: 10),

              SectionTitle(title: "Wprowadzenie"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Autonomiczny samochód nie tylko „widzi” otoczenie dzięki sensorom — musi również ",
                  ),
                  const TextSpan(
                    text: "podejmować decyzje, tak jak kierowca.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Decyduje m.in. o tym, czy hamować, przyspieszać, omijać przeszkodę, zmieniać pas ruchu lub zatrzymać się przed pieszym.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W tej lekcji poznasz trzy główne metody podejmowania decyzji w autonomii.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Po co pojazdowi warstwa decyzyjna?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [const TextSpan(text: "Algorytmy decyzyjne:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "wybierają najlepszą akcję w danej sytuacji,",
                "łączą dane z kamery, radaru i LIDARu,",
                "działają jak „mózg kierowcy”,",
                "pozwalają planować przyszłe ruchy, nie tylko reagować.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        " Widzimy pieszego → oceniamy prędkość → podejmujemy decyzję o hamowaniu.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Decision Trees - drzewa decyzyjne"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Drzewo decyzyjne to zestaw uporządkowanych pytań „tak/nie”, które prowadzą do konkretnej akcji.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład drzewa:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Czy przed samochodem znajduje się przeszkoda?",
                description:
                    " jeśli tak:\n    Czy odległość jest mniejsza niż X metrów?\n    jeśli tak:\n        hamuj\n    jeśli nie:\n        wyprzedź lub omiń",
              ),

              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Drzewa są proste, szybkie, ale przy skomplikowanych sytuacjach mogą stać się zbyt duże.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title: "FSM - Finite State Machines (Maszyny stanów)",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "FSM to podejście, w którym samochód jest zawsze w jednym z określonych „stanów”.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykładowe stany:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "jazda prosto",
                "zwolnienie",
                "hamowanie",
                "omijanie",
                "zatrzymanie",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Każdy stan ma logiczne przejścia do innych.",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        "Jazda → przeszkoda wykryta → Zwolnienie → przeszkoda blisko → hamowanie.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "FSM są bardzo stabilne i często używane w systemach bezpieczeństwa.",
                  ),
                ],
              ),

              //
              const SizedBox(height: 20),

              SectionTitle(title: "Behavior Planning - planowanie zachowania"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Behavior Planning jest bardziej „inteligentne” niż FSM.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "To poziom, który przypomina planowanie kierowcy:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.track_changes_outlined,
                text: "przewidywanie ruchu innych pojazdów.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.forward_5_outlined,
                text: "planowanie kilku sekund do przodu.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.alt_route_outlined,
                text:
                    "wybieranie najlepszego manewru (nie tylko reakcji na bieżącą sytuację).",
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Behavior Planner ocenia:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "bezpieczeństwo,",
                "komfort jazdy,",
                "przepisy ruchu drogowego,",
                "płynność ruchu,",
                "przyszłe konsekwencje manewru.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        "Auto ocenia, czy zmiana pasa za 2 sekundy będzie lepsza niż hamowanie teraz.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Podsumowanie lekcji"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W autonomicznych pojazdach stosuje się trzy główne typy algorytmów decyzyjnych:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              NumberListWidget(
                number: 1,
                title: "Decision Trees",
                description: "szybkie decyzje na podstawie warunków „tak/nie”.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 2,
                title: "FSM (Finite State Machines)",
                description: "precyzyjne zarządzanie stanami pojazdu.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 3,
                title: "Behavior Planning",
                description:
                    "planowanie przyszłych manewrów z uwzględnieniem bezpieczeństwa i komfortu.",
              ),
              const SizedBox(height: 20),

              const LessonNavigationButtons(
                nextPageWidget: LessonPageExamples(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
