import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageFusionExample extends StatefulWidget {
  const LessonPageFusionExample({super.key});

  @override
  State<LessonPageFusionExample> createState() =>
      _LessonPageFusionExampleState();
}

class _LessonPageFusionExampleState extends State<LessonPageFusionExample> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 9;

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
                title:
                    "Przykład fuzji: LIDAR + Kamera = dokładniejsze rozpoznanie obiektów",
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
                    text: "LIDAR i kamera to dwa czujniki, które ",
                  ),
                  const TextSpan(
                    text: "znakomicie się uzupełniają.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Każdy z nich widzi świat inaczej:"),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "kamera — kolory, tekstury, znaki, linie,",
                "LIDAR — dokładne odległości i kształt obiektu w 3D.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Połączenie ich danych sprawia, że autonomiczny pojazd może rozpoznawać obiekty znacznie dokładniej niż przy użyciu jednego sensora. To jedna z najważniejszych form fuzji danych w nowoczesnych systemach autonomicznych.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Dlaczego LIDAR i kamera są łączone?"),
              const SizedBox(height: 20),

              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Kamera daje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "kolory,",
                "linie pasów ruchu,",
                "sygnalizację świetlną,",
                "rozpoznawanie obiektów (np. „to pieszy”, „to samochód”).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "LIDAR daje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "rzeczywistą odległość,",
                "pełną geometrię obiektu,",
                "niezależność od światła,",
                "dokładne 3D otoczenia.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Łącząc je, system otrzymuje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "co to za obiekt (kamera),",
                "gdzie dokładnie jest (LIDAR),",
                "jak duży i jak daleko (LIDAR + kamera),",
                "z jaką pewnością (fuzja).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "To jak połączenie fotografii z mapą 3D — dużo pełniejsza informacja.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Jak wygląda fuzja w praktyce?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Najczęstszym przykładem jest nakładanie chmury punktów LIDAR-u na obraz z kamery.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "W uproszczeniu:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Kamera robi zdjęcie sceny.",
                "LIDAR tworzy chmurę punktów 3D.",
                "Każdy punkt z LIDAR-u jest „rzutowany” na obraz z kamery.",
                "Punkty przyjmują kolor z odpowiadającego im piksela.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Powstaje precyzyjna mapa otoczenia w 3D z kolorami. To właśnie nazywamy ",
                  ),
                  const TextSpan(
                    text: "colorized point cloud — kolorowaną chmurą punktów.",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Przykład scenariusza: rozpoznawanie pieszego",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Wyobraźmy sobie sytuację: Samochód zbliża się do przejścia.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Kamera wykrywa:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "sylwetkę pieszego,",
                "jego kolor ubrania,",
                "kontekst — przejście dla pieszych.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "LIDAR wykrywa:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "dokładną odległość,",
                "wysokość i kształt sylwetki,",
                "czy pieszy się porusza (analiza zmian punktów).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Połączenie obu sensorów daje:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "100% pewności, że to pieszy, nie np. oznakowanie,",
                "dokładną odległość do centymetrów,",
                "precyzyjne położenie w 3D (prawo-lewo, przód-tył, wysokość),",
                "przewidywanie, czy pieszy wkroczy na przejście.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Dzięki temu system wie, kiedy rozpocząć hamowanie.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Jak wygląda nakładanie danych krok po kroku?",
              ),
              const SizedBox(height: 20),

              NumberListWidget(
                number: 1,
                title: "Kalibracja kamer i LIDAR-u",
                description:
                    "System musi „wiedzieć”, gdzie dokładnie znajduje się każdy czujnik i w którą stronę patrzy.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 2,
                title: "Połączenie współrzędnych",
                description:
                    "Dane LIDAR-u są w 3D, kamera w 2D - trzeba je zsynchronizować.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 3,
                title: "Rzutowanie punktów",
                description:
                    "Każdy punkt LIDAR-u trafia w odpowiedni piksel obrazu.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 4,
                title: "Nadawanie koloru",
                description:
                    "Punktom przypisywany jest kolor z kamery → obiekt staje się bardziej rozpoznawalny.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 5,
                title: "Detekcja obiektów",
                description:
                    "AI analizuje połączony obraz i wykrywa: pieszych, samochody, znaki drogowe, rowerzystów.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 6,
                title: "Klasyfikacja i śledzenie",
                description:
                    "Fuzja pozwala określić: co to jest, gdzie dokładnie jest, jak szybko się porusza, jak może się poruszać dalej.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Korzyści z połączenia LIDAR + Kamera"),
              const SizedBox(height: 20),

              TextIconWidget(
                icon: Icons.search_outlined,
                text:
                    "Lepsze rozpoznawanie obiektów: Kamery pomagają rozpoznać typ obiektu, LIDAR dostarcza dokładne odległości.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.clear_all_outlined,
                text:
                    "Mniejsza liczba „fałszywych detekcji”: Kolor i kształt muszą do siebie pasować, co eliminuje błędy.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.wb_cloudy_outlined,
                text:
                    "Możliwość pracy w trudnych warunkach: Kiedy kamera słabo widzi (noc, mgła), LIDAR nadal działa — i odwrotnie.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.track_changes_outlined,
                text:
                    "Bardziej stabilne śledzenie obiektów: Wielosensorowe dane zmniejszają ryzyko „gubienia” obiektu.",
              ),
              const SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.star_border,
                text:
                    "Podstawa dla zaawansowanych systemów autonomii: Większość algorytmów autonomicznej jazdy potrzebuje dokładnych danych z obu czujników.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Podsumowanie"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Fuzja LIDAR + Kamera to jedna z najważniejszych technik w autonomicznych pojazdach.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Dzięki niej systemy AI widzą świat:"),
                ],
              ),
              const SizedBox(height: 4),
              buildSimpleBulletedList([
                "bardziej szczegółowo,",
                "bardziej dokładnie,",
                "bardziej niezawodnie.",
              ]),
              const SizedBox(height: 12),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "To właśnie kombinacja obrazu 2D i danych 3D umożliwia tak precyzyjne wykrywanie pieszych, pojazdów i przeszkód.",
                  ),
                ],
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
