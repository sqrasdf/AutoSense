import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/pages/4_autonomy/lesson_page_autonomy_intro.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

Widget _buildTableHeaderCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget _buildTableCell(String text, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
      ),
    ),
  );
}

class LessonPageKalmanDeepLearning extends StatefulWidget {
  const LessonPageKalmanDeepLearning({super.key});

  @override
  State<LessonPageKalmanDeepLearning> createState() =>
      _LessonPageKalmanDeepLearningState();
}

class _LessonPageKalmanDeepLearningState
    extends State<LessonPageKalmanDeepLearning> {
  Widget _buildComparisonTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, width: 1.0),
      columnWidths: const {
        0: FlexColumnWidth(1.6),
        1: FlexColumnWidth(2.0),
        2: FlexColumnWidth(2.0),
        3: FlexColumnWidth(2.0),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            _buildTableHeaderCell('Metoda'),
            _buildTableHeaderCell('Zalety'),
            _buildTableHeaderCell('Wady'),
            _buildTableHeaderCell('Typowe zastosowania'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Kalman Filter', isBold: true),
            _buildTableCell('Szybki, stabilny, przewidywalny'),
            _buildTableCell('Ma ograniczenia w złożonych sytuacjach'),
            _buildTableCell('Śledzenie obiektów, lokalizacja'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('Deep Learning', isBold: true),
            _buildTableCell('Uczy się z danych, bardzo skuteczny'),
            _buildTableCell('Wymaga dużych datasetów i mocy obliczeniowej'),
            _buildTableCell('Rozpoznawanie i klasyfikacja obiektów'),
          ],
        ),
      ],
    );
  }

  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 10;

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
                title: "Filtr Kalmana i Deep Learning w Fuzji Danych",
                lessonNumber: lessonNumber,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),

              // Wprowadzenie
              SectionTitle(title: "Wprowadzenie"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Fuzja danych w autonomicznych pojazdach nie polega jedynie na „łączeniu obrazów”.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Aby stworzyć precyzyjny, stabilny i przewidywalny model otoczenia, systemy autonomiczne wykorzystują zaawansowane metody matematyczne i sztuczną inteligencję.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Do najczęściej stosowanych należą:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Filtr Kalmana (KF) i jego warianty,",
                "Deep Learning (DL) — modele uczące się zależności między sensorami.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W tej lekcji wyjaśnimy jak działają te metody, dlaczego są potrzebne i kiedy stosuje się każdą z nich.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Dlaczego sama fuzja geometryczna nie wystarcza?",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Połączenie danych z LIDAR-u i kamery poprawia rozpoznanie obiektów, ale wciąż istnieją problemy:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "czujniki mają szumy,",
                "wykrywają obiekty w różnych momentach (opóźnienia),",
                "niektóre dane mogą być chwilowo błędne (np. odbicia z LIDAR-u),",
                "system musi przewidywać ruch obiektów — nie tylko je widzieć.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Tu wchodzą w grę metody filtracji i predykcji, takie jak KF lub modele DL.",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Filtr Kalmana — podstawy"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Filtr Kalmana to algorytm matematyczny służący do:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "wygładzania szumu pomiarowego,",
                "łączenia danych z różnych źródeł,",
                "przewidywania przyszłego stanu obiektu (np. położenia).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Jak to działa? (prosto)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Predykcja",
                description:
                    "system przewiduje, gdzie obiekt powinien się znajdować.",
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Aktualizacja",
                description:
                    "porównuje predykcję z nowymi pomiarami z czujników.",
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Poprawka",
                description:
                    "aktualizuje położenie na podstawie obu informacji.",
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Efekt:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        " Bardziej stabilne, spójne śledzenie obiektów — nawet gdy czujniki zgubią obiekt na chwilę.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Gdzie jest stosowany?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "śledzenie innych samochodów,",
                "śledzenie pieszych,",
                "utrzymywanie pozycji własnego pojazdu (lokalizacja).",
              ]),
              //
              const SizedBox(height: 20),

              SectionTitle(
                title: "Extended Kalman Filter (EKF) i inne warianty",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Oryginalny filtr Kalmana działa świetnie… ale tylko w systemach ",
                  ),
                  const TextSpan(
                    text: "liniowych.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "A samochody? Raczej nie poruszają się po liniach prostych i nie operują w „liniowym świecie”. Dlatego stosuje się warianty:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "EKF — Extended Kalman Filter (dla funkcji nieliniowych),",
                "UKF — Unscented Kalman Filter (dokładniejszy, popularny w autonomii),",
                "Particle Filter (do skomplikowanej lokalizacji 3D).",
              ]),
              const SizedBox(height: 20),

              SectionTitle(title: "Deep Learning w fuzji danych"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Drugą dużą kategorią technik jest Deep Learning, szczególnie sieci neuronowe, które mogą:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "łączyć dane z kamery i LIDAR-u,",
                "wykrywać obiekty,",
                "klasyfikować je,",
                "przewidywać ich ruch.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Model CNN+MLP może dostać jako wejście:",
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "obraz RGB z kamery,",
                "wstępnie przetworzoną siatkę punktów z LIDAR-u (np. bird’s-eye view).",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(children: [const TextSpan(text: "Na wyjściu:")]),
              buildSimpleBulletedList([
                "typ obiektu (samochód, pieszy, rower),",
                "jego położenie,",
                "przewidywana trajektoria.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Zalety DL:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "uczy się zależności, których nie trzeba programować ręcznie,",
                "potrafi łączyć dane o różnych charakterystykach,",
                "dobrze radzi sobie w trudnych warunkach (mgła, noc, deszcz).",
              ]),
              //
              const SizedBox(height: 20),

              SectionTitle(title: "KF vs Deep Learning — kiedy co stosować?"),
              const SizedBox(height: 20),
              _buildComparisonTable(),
              const SizedBox(height: 20),

              SectionTitle(title: "Podsumowanie"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Filtr Kalmana i Deep Learning to dwa filary nowoczesnej fuzji danych:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "KF skupia się na filtrowaniu, wygładzaniu i przewidywaniu ruchu,",
                "DL skupia się na rozpoznawaniu, klasyfikacji i semantyce obiektów.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W autonomicznych pojazdach obie metody współistnieją, tworząc bardzo precyzyjny i stabilny obraz otoczenia.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const LessonNavigationButtons(
                nextPageWidget: LessonPageAutonomyIntro(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
