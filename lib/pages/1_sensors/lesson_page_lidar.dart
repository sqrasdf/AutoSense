import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:autosense/pages/1_sensors/lesson_page_camera.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageLidar extends StatefulWidget {
  const LessonPageLidar({super.key});

  @override
  State<LessonPageLidar> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPageLidar> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 2;

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
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LessonTitlePanel(title: "Podstawy LIDAR", lessonNumber: 2),

              Divider(),

              SizedBox(height: 20),
              SectionTitle(title: "Wprowadzenie"),
              SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "LIDAR to jeden z najdokładniejszych sensorów używanych w autonomicznych pojazdach. Dzięki niemu samochód potrafi „zobaczyć” otoczenie w trzech wymiarach - stworzyć mapę 3D dróg, budynków, pieszych i przeszkód.",
                  ),
                ],
              ),
              SizedBox(height: 16),
              MainTextWidget(
                color: Colors.grey[600],
                children: [
                  const TextSpan(
                    text:
                        "Umożliwia to precyzyjne omijanie obiektów oraz bezpieczne prowadzenie pojazdu nawet w skomplikowanym otoczeniu miejskim.",
                  ),
                ],
              ),

              SizedBox(height: 30),
              SectionTitle(title: "Czym jest LIDAR?"),
              SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Nazwa pochodzi od angielskiego "),
                ],
              ),
              SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Laserowe impulsy pozwalają mierzyć"),
                ],
              ),
              SizedBox(height: 10),
              BulletPointLesson(text: "odległość do obiektów,"),
              SizedBox(height: 10),
              BulletPointLesson(text: "ich kształt,"),
              SizedBox(height: 10),
              BulletPointLesson(
                text: "ich pozycję w trójwymiarowej przestrzeni.",
              ),
              SizedBox(height: 20),
              MainTextWidget(
                color: Colors.grey[600],
                children: [
                  const TextSpan(text: "W efekcie powstaje tzw. "),
                  const TextSpan(
                    text: "chmura punktów",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: " (point cloud), czyli dokładna mapa otoczenia.",
                  ),
                ],
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Z czego składa się LIDAR?"),
              SizedBox(height: 20),
              PointListWidget(
                title: "Laser / emiter światła",
                description:
                    "Wysyła bardzo krótkie impulsy światła w wielu kierunkach.",
              ),
              SizedBox(height: 20),
              PointListWidget(
                title: "Detektor / odbiornik",
                description: "Zbiera światło odbite od obiektów.",
              ),
              SizedBox(height: 20),
              PointListWidget(
                title: "Mechanizm skanujący",
                description:
                    "Może to być obracająca się głowica (360°) lub układ luster kierujący wiązkami w różne strony.",
              ),
              SizedBox(height: 20),
              PointListWidget(
                title: "Jednostka obliczeniowa",
                description:
                    "Analizuje czas powrotu impulsów i tworzy trójwymiarowy obraz sceny.",
              ),

              SizedBox(height: 20),
              SectionTitle(title: "Jak działa LIDAR?"),
              SizedBox(height: 20),
              NumberListWidget(
                number: 1,
                title: "Wysłanie impulsu światła",
                description:
                    "LIDAR wysyła setki tysięcy (a nawet miliony) krótkich impulsów laserowych w ciągu sekundy.",
              ),

              SizedBox(height: 20),
              NumberListWidget(
                number: 2,
                title: "Odbicie od obiektu",
                description:
                    "Gdy impuls trafi na pieszych, samochody, znaki czy budynki - odbija się i wraca do detektora.",
              ),
              SizedBox(height: 20),
              NumberListWidget(
                number: 3,
                title: "Pomiar czasu powrotu",
                description:
                    "System mierzy, ile czasu minęło od wysłania impulsu do jego powrotu. Ponieważ światło ma ogromną prędkość, pomiary są niezwykle precyzyjne.",
              ),
              SizedBox(height: 20),
              NumberListWidget(
                number: 4,
                title: "Tworzenie mapy 3D",
                description:
                    "Każdy pomiar to jeden punkt w przestrzeni. Setki tysięcy punktów tworzą chmurę punktów, czyli trójwymiarowy obraz całego otoczenia.",
              ),

              SizedBox(height: 20),
              SectionTitle(title: "Czym jest LIDAR?"),
              SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Dzięki wysokiej rozdzielczości LIDAR:"),
                ],
              ),
              SizedBox(height: 10),
              BulletPointLesson(text: "rozpoznaje sylwetki pieszych,"),
              SizedBox(height: 10),
              BulletPointLesson(
                text:
                    "dostrzega niewielkie przeszkody na drodze (np. rower, pies, pachołek),",
              ),
              SizedBox(height: 10),
              BulletPointLesson(
                text: "potrafi określić kształt i rozmiar obiektu",
              ),
              SizedBox(height: 10),
              BulletPointLesson(
                text: "tworzy dokładny model sceny nawet w dynamicznym ruchu.",
              ),
              SizedBox(height: 20),
              MainTextWidget(
                color: Colors.grey[600],
                children: [
                  const TextSpan(
                    text:
                        "To sprawia, że LIDAR jest jednym z najważniejszych sensorów w scenariuszach, gdzie bezpieczeństwo pieszych ma kluczowe znaczenie.",
                  ),
                ],
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Zalety LIDARU w autonomicznych pojazdach"),
              SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.check_circle_outline,
                text: "Bardzo wysoka dokładność pomiarów.",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.pin_drop_outlined,
                text: "Szczegółowa mapa 3D otoczenia.",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.remove_red_eye_outlined,
                text:
                    "Niezależność od cieni, odbić i warunków oświetleniowych.",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.person_outline,
                text:
                    "Świetne wykrywanie krawędzi, pieszych i małych przeszkód.",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.route_outlined,
                text: "Ułatwia planowanie trasy i unikanie kolizji.",
              ),
              SizedBox(height: 20),
              LessonNavigationButtons(nextPageWidget: LessonPageCamera()),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
