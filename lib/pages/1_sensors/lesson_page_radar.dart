import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:autosense/pages/1_sensors/animations/animation_radar.dart';
import 'package:autosense/pages/1_sensors/lesson_page_lidar.dart';
import 'package:autosense/utils.dart';
import 'package:flutter/material.dart';

class LessonPageRadar extends StatefulWidget {
  const LessonPageRadar({super.key});

  @override
  State<LessonPageRadar> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPageRadar> {
  late ScrollController _scrollController;
  bool _isLessonCompleted = false;
  final double _completionThreshold = 0.90;

  int lessonNumber = 1;

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
        padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 25),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              LessonTitlePanel(
                title: "Podstawy działania radarów",
                lessonNumber: lessonNumber,
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 10),

              SectionTitle(title: "Wprowadzenie"),
              SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Radar to jeden z kluczowych sensorów w autonomicznych pojazdach. Pomaga wykrywać obiekty znajdujące się przed samochodem oraz precyzyjnie mierzyć ich prędkość. Dzięki temu pojazd może bezpiecznie utrzymywać dystans, hamować, a nawet omijać przeszkody.",
                  ),
                ],
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Czym jest radar?"),
              SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: 'Słowo ,,radar” pochodzi od angielskiego ',
                  ),
                  const TextSpan(
                    text: 'Radio Detection and Ranging',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        '. Oznacza urządzenie, które wykorzystuje fale radiowe do wykrywania obiektów oraz mierzenia ich odległości i prędkości.',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        'W autonomicznych samochodach stosuje się głównie radary ',
                  ),
                  TextSpan(
                    text: 'FMCW (Frequency Modulated Continuous Wave)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Colors.grey[600], // Pogrubienie zachowuje szary kolor
                    ),
                  ),
                  const TextSpan(
                    text:
                        ', które są precyzyjne, odporne na złe warunki pogodowe i nadają się do pracy w ruchu.',
                  ),
                ],
                color: Colors.grey[600],
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Z czego składa się radar?"),
              SizedBox(height: 20),
              PointListWidget(
                title: "Nadajnik",
                description:
                    "Generuje fale radiowe o wysokiej częstotliwości (zwykle 76-81 GHz). Fale te są wysyłane w kierunku sceny przed pojazdem.",
              ),
              SizedBox(height: 20),
              PointListWidget(
                title: "Anteny nadawcze i odbiorcze",
                description:
                    "Anteny kształtują wiązkę radaru i określają, w których kierunkach 'patrzy' sensor.",
              ),
              SizedBox(height: 20),
              PointListWidget(
                title: "Odbiornik",
                description:
                    "Zbiera fale odbite od obiektów - innych aut, pieszych, barier, znaków.",
              ),
              SizedBox(height: 20),
              PointListWidget(
                title: "Procesor sygnałowy",
                description:
                    "Analizuje powracające sygnały, wyliczając odległość, prędkość oraz względne położenie obiektów.",
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Jak działa radar?"),
              SizedBox(height: 20),
              NumberListWidget(
                number: 1,
                title: "Emisja fali radiowej",
                description:
                    "Radar wysyła falę elektromagnetyczną w stronę drogi przed pojazdem.",
              ),
              SizedBox(height: 25),
              NumberListWidget(
                number: 2,
                title: "Odbicie od obiektu",
                description:
                    "Gdy fala trafi na obiekt (np. samochód), część energii odbija się i wraca do radaru.",
              ),
              SizedBox(height: 25),
              NumberListWidget(
                number: 3,
                title: "Pomiar czasu i częstotliwości",
                description:
                    "Procesor porównuje falę wysłaną z falą odebraną. Na podstawie różnicy w czasie oblicza odległość, a dzięki różnicy w częstotliwości (efekt Dopplera) oblicza prędkość obiektu.",
              ),
              SizedBox(height: 25),
              NumberListWidget(
                number: 4,
                title: "Wyznaczenie położenia",
                description:
                    "Dzięki wielu antenom radar oblicza, pod jakim kątem znajduje się obiekt. W ten sposób tworzy prostą mapę otoczenia przed autem.",
              ),
              const SizedBox(height: 30),

              RadarWaveWidget(),
              const SizedBox(height: 30),

              SectionTitle(
                title: "Dlaczego radar jest ważny w autonomicznych pojazdach?",
              ),
              SizedBox(height: 10),
              TextIconWidget(
                icon: Icons.cloud_outlined,
                text: "Działa w deszczu, mgle i ciemności.",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.speed_outlined,
                text: "Dokładnie mierzy prędkość innych pojazdów.",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.check_circle_outline,
                text:
                    "Jest kluczowy w systemach jak ACC (Adaptive Cruise Control) i AEB (Automatic Emergency Braking).",
              ),
              SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.settings_input_component_outlined,
                text:
                    "Współpracuje z kamerą i lidarem, tworząc kompletny obraz otoczenia.",
              ),
              SizedBox(height: 20),
              LessonNavigationButtons(nextPageWidget: LessonPageLidar()),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
