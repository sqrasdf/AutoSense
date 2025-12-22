import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:autosense/pages/3_fusion/lesson_page_fusion_example.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageFusionBasics extends StatefulWidget {
  const LessonPageFusionBasics({super.key});

  @override
  State<LessonPageFusionBasics> createState() =>
      _LessonPageSensorFusionIntroState();
}

class _LessonPageSensorFusionIntroState extends State<LessonPageFusionBasics> {
  Widget _buildSensorTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, width: 1.0),
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(2.5),
        2: FlexColumnWidth(2.5),
      },
      children: [
        // Nagłówek
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            _buildTableHeaderCell('Sensor'),
            _buildTableHeaderCell('Zalety'),
            _buildTableHeaderCell('Ograniczenia'),
          ],
        ),
        // Kamera
        TableRow(
          children: [
            _buildTableCell('Kamera', isBold: true),
            _buildTableCell('kolory, znaki, linie'),
            _buildTableCell('słaba widoczność w nocy, oślepienie'),
          ],
        ),
        // LIDAR
        TableRow(
          children: [
            _buildTableCell('LIDAR', isBold: true),
            _buildTableCell('dokładna geometria, 3D'),
            _buildTableCell('brak informacji o kolorze i typie obiektu'),
          ],
        ),
        // Radar
        TableRow(
          children: [
            _buildTableCell('Radar', isBold: true),
            _buildTableCell('świetny pomiar prędkości'),
            _buildTableCell('mała rozdzielczość obrazu'),
          ],
        ),
        // Ultradźwięki
        TableRow(
          children: [
            _buildTableCell('Ultradźwięki', isBold: true),
            _buildTableCell('bliskie przeszkody'),
            _buildTableCell('zasięg tylko kilka metrów'),
          ],
        ),
      ],
    );
  }

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

  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 8;

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
                title: "Co to jest fuzja danych? Podstawy i cele",
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
                        "Autonomiczny pojazd korzysta z wielu czujników: kamery, LIDAR-u, radarów, ultradźwięków. Każdy z nich widzi świat inaczej, a żaden nie jest idealny.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Dlatego samochód potrzebuje sposobu, aby połączyć te informacje i stworzyć jeden spójny obraz otoczenia. To właśnie nazywamy ",
                  ),
                  const TextSpan(
                    text: "fuzją danych (sensor fusion).",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [const TextSpan(text: "Dzięki niej pojazd „wie”:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "co znajduje się wokół niego,",
                "z jaką prędkością poruszają się obiekty,",
                "jakie manewry można podjąć bezpiecznie.",
              ]),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Dlaczego pojedyncze czujniki nie wystarczają?",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Każdy sensor ma swoje mocne i słabe strony:",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildSensorTable(),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Fuzja rozwiązuje te problemy — AI bierze najlepsze elementy każdego czujnika i łączy je.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(children: [const TextSpan(text: "Przykłady:")]),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "kamera widzi kolor pojazdu, ale nie wie, jak daleko jest — LIDAR to podaje,",
                "radar wykrywa, że auto przed nami hamuje, ale kamera mówi co to jest.",
              ]),
              const SizedBox(height: 20),

              SectionTitle(title: "Czym jest fuzja danych?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "To proces łączenia informacji z różnych sensorów w jedną spójną reprezentację. Można ją stosować na trzech poziomach:",
                  ),
                ],
              ),
              const SizedBox(height: 16),

              PointListWidget(
                title: "Poziom 1 — Fuzja danych surowych (Low-level fusion)",
                description:
                    "Łączenie sygnałów z czujników „na wejściu”. Przykład: łączenie chmury punktów z LIDAR-u z pikselami kamery.",
              ),
              const SizedBox(height: 10),

              PointListWidget(
                title: "Poziom 2 — Fuzja cech (Mid-level fusion)",
                description:
                    "Każdy sensor najpierw wykrywa obiekty lub cechy, dopiero potem następuje ich integracja.",
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład:",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "kamera wykrywa „kształt pieszego”,",
                "LIDAR wykrywa „bryłę obiektu”",
              ]),
              const SizedBox(height: 10),

              PointListWidget(
                title: "Poziom 3 — Fuzja decyzji (High-level fusion)",
                description:
                    "Każdy sensor proponuje swoją decyzję, a system wybiera wspólne rozwiązanie.",
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykład:",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "radar: „hamowanie konieczne”",
                "kamera: „przeszkoda wykryta”",
                "ultradźwięki: „bardzo blisko”",
              ]),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "→ auto hamuje awaryjnie.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Jakie problemy rozwiązuje fuzja danych?"),
              const SizedBox(height: 20),

              TextIconWidget(
                icon: Icons.check_circle_outline,
                text:
                    "Dokładniejsze wykrywanie obiektów: Łącząc wiele źródeł, AI redukuje błędy każdego z nich.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.cloud_off_outlined,
                text:
                    "Stabilny pomiar w trudnych warunkach: Gdy kamera nie widzi — nadal działają radar lub LIDAR.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.moving_outlined,
                text:
                    "Lepsze śledzenie ruchu obiektów: Połączone dane dają płynniejszy, mniej „skokowy” ruch śledzonych pojazdów.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.gpp_good_outlined,
                text:
                    "Podejmowanie bezpieczniejszych decyzji: Więcej źródeł informacji = mniejsze ryzyko błędnej interpretacji.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Gdzie fuzja jest używana w autonomii?"),
              const SizedBox(height: 20),
              buildSimpleBulletedList([
                "wykrywanie pieszych i rowerzystów,",
                "rozpoznawanie znaków drogowych,",
                "przewidywanie ruchu innych pojazdów,",
                "tworzenie map 3D otoczenia,",
                "jazda w mieście i na autostradzie,",
                "parkowanie i manewry niskiej prędkości.",
              ]),
              const SizedBox(height: 20),

              // Podsumowanie
              SectionTitle(title: "Podsumowanie"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Fuzja danych jest fundamentem autonomii",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        " — dzięki niej pojazd nie opiera się na jednym, zawodnym źródle informacji, lecz tworzy pełniejszy, bardziej wiarygodny obraz otoczenia.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "W kolejnych lekcjach przeanalizujemy:"),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "jak dokładnie łączy się LIDAR i kamerę,",
                "jak działają filtr Kalmana i metody deep learning w fuzji.",
              ]),
              const SizedBox(height: 20),

              const LessonNavigationButtons(
                nextPageWidget: LessonPageFusionExample(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
