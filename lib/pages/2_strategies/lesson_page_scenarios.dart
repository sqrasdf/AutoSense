import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/scenario_option_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/pages/3_fusion/lesson_page_fusion_basics.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageScenarios extends StatefulWidget {
  const LessonPageScenarios({super.key});

  @override
  State<LessonPageScenarios> createState() =>
      _LessonPageScenarioSelectionState();
}

class _LessonPageScenarioSelectionState extends State<LessonPageScenarios> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 7;

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

        await saveLessonCompletionByIndex(lessonNumber - 1, 14);

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
                title: "Co zrobi pojazd? - wybierz poprawne działanie AI",
                lessonNumber: lessonNumber,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),

              SectionTitle(title: "Wprowadzenie"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Gdy autonomiczny samochód obserwuje drogę, nie tylko „widzi” otoczenie — musi także ",
                  ),
                  const TextSpan(
                    text: "zdecydować, jak zareagować.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W tym module uczymy się interpretować konkretne sytuacje drogowe oraz przewidywać, jakie zachowanie wybierze sztuczna inteligencja.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Scenariusze typu „co teraz zrobi pojazd?” pozwalają zrozumieć, jak łączą się dane z sensorów i algorytmy podejmowania decyzji — czyli dlaczego samochód czasem hamuje, czasem omija przeszkodę, a czasem czeka.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Czym są scenariusze decyzyjne?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Scenariusze decyzyjne to krótkie opisy sytuacji drogowych, w których użytkownik ma przewidzieć działanie AI.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Wykorzystują dane z sensorów:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "LIDAR",
                description: "kształty i odległości",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Radar",
                description: "prędkości i zbliżanie",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Kamera",
                description: "linie, znaki, piesi",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Ultradźwięki",
                description: "bardzo bliskie przeszkody",
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [const TextSpan(text: "Ich celem jest:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "zrozumienie logiki autonomii,",
                "trening przewidywania reakcji samochodu,",
                "budowanie świadomości, jak działają decyzje AI w praktyce.",
              ]),
              const SizedBox(height: 20),

              SectionTitle(title: "Z czego składa się taki scenariusz?"),
              const SizedBox(height: 20),
              PointListWidget(
                title: "Opis sytuacji",
                description:
                    "Krótka historia przedstawiająca sytuację drogową, np. „pieszy zbliża się do przejścia”, „pojazd poprzedzający hamuje”.",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Dane z sensorów",
                description:
                    "Wyciąg najważniejszych sygnałów: odległości, prędkości, kierunki ruchu.",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Możliwe reakcje AI",
                description:
                    "Zwykle 2-4 opcje do wyboru, np.: zahamować, zmienić pas, utrzymać prędkość, zatrzymać się i poczekać.",
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              PointListWidget(
                title: "Prawidłowa decyzja",
                description:
                    "Wybrana na podstawie zasad bezpieczeństwa i logiki algorytmów.",
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Jak analizować taki scenariusz? - krok po kroku",
              ),
              const SizedBox(height: 20),
              NumberListWidget(
                number: 1,
                title: "Zrozum kontekst",
                description:
                    "Czy coś porusza się w stronę pojazdu? Czy coś blokuje pas?",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 2,
                title: "Przeczytaj dane z sensorów",
                description:
                    "radar: prędkość obiektu, lidar: odległość, kamera: typ obiektu, ultradźwięki: bardzo bliskie przeszkody.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 3,
                title: "Wyklucz niebezpieczne działania",
                description:
                    "Opcje takie jak Zmiana pasa przy aucie obok lub Przyspieszenie przy pieszym są automatycznie eliminowane przez AI.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 4,
                title: "Zastosuj zasadę bezpieczeństwa",
                description:
                    "Zawsze priorytetem jest: „Zachowaj minimalne ryzyko kolizji i stabilność jazdy.”",
              ),
              const SizedBox(height: 5),
              NumberListWidget(
                number: 5,
                title: "Wybierz najbardziej prawdopodobną reakcję AI",
                description:
                    "Hamowanie, zatrzymanie, ominięcie lub kontynuacja jazdy.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Przykładowe scenariusze „Co zrobi pojazd?”"),
              const SizedBox(height: 20),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Scenariusz 1: Pieszy przy przejściu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Sytuacja: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        "Samochód zbliża się do przejścia. Pieszy stoi na krawężniku, patrzy w stronę jezdni.",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Dane z sensorów: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Kamera: pieszy wykryty, stoi blisko krawężnika",
                "Radar: brak ruchu zza pojazdu",
                "Lidar: czysta przestrzeń przed pojazdem",
                "Prędkość pojazdu: 30 km/h",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Możliwe reakcje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              ScenarioOptionWidget(
                optionText: "A) AI kontynuuje jazdę bez zmiany prędkości",
                correctAnswerClicked: correctAnswerClicked[0],
                index: 0,
              ),
              ScenarioOptionWidget(
                optionText: "B) AI redukuje prędkość i przygotowuje hamowanie",
                index: 0,
                onCorrectAnswer: onCorrectAnswer,
                isCorrect: true,
              ),
              ScenarioOptionWidget(
                optionText: "C) AI zatrzymuje się natychmiast",
                correctAnswerClicked: correctAnswerClicked[0],
                index: 0,
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Poprawna decyzja: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "B.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: correctAnswerClicked[0]
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                  TextSpan(
                    text:
                        " Pojazd zwolni i przygotuje hamowanie, ponieważ pieszy może wejść na przejście.",
                    style: TextStyle(
                      color: correctAnswerClicked[0]
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Scenariusz 2: Auto z przodu nagle hamuje",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Dane z sensorów: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Radar: gwałtowny spadek prędkości poprzedzającego auta",
                "Lidar: odległość skraca się szybko",
                "Kamera: brak możliwości zmiany pasa",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Możliwe reakcje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ScenarioOptionWidget(
                optionText: "A) AI wykonuje natychmiastową zmianę pasa",
                correctAnswerClicked: correctAnswerClicked[1],
                index: 1,
              ),
              ScenarioOptionWidget(
                optionText: "B) AI hamuje awaryjnie",
                isCorrect: true,
                onCorrectAnswer: onCorrectAnswer,
                index: 1,
              ),
              ScenarioOptionWidget(
                optionText: "C) AI przyspiesza, aby utrzymać dystans",
                correctAnswerClicked: correctAnswerClicked[1],
                index: 1,
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Poprawna decyzja: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "B.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: correctAnswerClicked[1]
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                  TextSpan(
                    text:
                        " Zmiana pasa jest zablokowana, więc jedyna poprawna reakcja to hamowanie awaryjne.",
                    style: TextStyle(
                      color: correctAnswerClicked[1]
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Scenariusz 3: Przeszkoda na drodze przy niskiej prędkości",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Sytuacja: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        "Auto wjeżdża do parkingu. W odległości 2 m przed nim znajduje się wysoki słupek.",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Dane z sensorów: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Ultradźwięki: obiekt 2 m przed zderzakiem",
                "Kamera: obiekt potwierdzony",
                "Prędkość: 6 km/h",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Możliwe reakcje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ScenarioOptionWidget(
                optionText: "A) Zatrzymać się",
                isCorrect: true,
                onCorrectAnswer: onCorrectAnswer,
                index: 2,
              ),
              ScenarioOptionWidget(
                optionText: "B) Ominąć przeszkodę wykonując skręt",
                correctAnswerClicked: correctAnswerClicked[2],
                index: 2,
              ),
              ScenarioOptionWidget(
                optionText: "C) Przyspieszyć, uznając, że to błąd czujnika",
                correctAnswerClicked: correctAnswerClicked[2],
                index: 2,
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Poprawna decyzja: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "A.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: correctAnswerClicked[2]
                          ? Colors.black
                          : Colors.transparent,
                    ),
                  ),
                  TextSpan(
                    style: TextStyle(
                      color: correctAnswerClicked[2]
                          ? Colors.black
                          : Colors.transparent,
                    ),
                    text:
                        " Przy małych prędkościach ultradźwięki mają najwyższy priorytet — AI zatrzyma pojazd.",
                  ),
                ],
              ),
              const SizedBox(height: 30),

              SectionTitle(title: "Po co uczymy się takich scenariuszy?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [const TextSpan(text: "Pomagają zrozumieć:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "logikę działania systemów AI,",
                "priorytety bezpieczeństwa,",
                "sposób łączenia danych z wielu czujników,",
                "ograniczenia autonomii,",
                "jak interpretować zachowania pojazdu w różnych sytuacjach.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "To przygotowuje użytkownika do świadomego korzystania z autonomicznych funkcji — tak, aby rozumiał, „dlaczego auto robi to, co robi”.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const LessonNavigationButtons(
                nextPageWidget: LessonPageFusionBasics(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
