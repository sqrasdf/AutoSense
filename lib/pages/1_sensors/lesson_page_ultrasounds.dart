import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:flutter/material.dart';

class LessonPageUltrasound extends StatefulWidget {
  const LessonPageUltrasound({super.key});

  @override
  State<LessonPageUltrasound> createState() => _LessonPageUltrasoundState();
}

class _LessonPageUltrasoundState extends State<LessonPageUltrasound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LessonTitlePanel(
                title: "Ultradźwięki - systemy parkowania",
                lessonNumber: 4,
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
                        "Czujniki ultradźwiękowe to jedne z najprostszych i najstarszych sensorów wspomagających kierowcę. W autonomicznych pojazdach pełnią ważną rolę szczególnie podczas ",
                  ),
                  const TextSpan(
                    text: "parkowania oraz manewrów przy małej prędkości.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Dzięki nim samochód potrafi wykrywać bardzo bliskie przeszkody — takie, których radar lub kamera mogą nie zauważyć.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Czym są czujniki ultradźwiękowe?"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Czujniki ultradźwiękowe działają podobnie jak sonar u nietoperza.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Wysyłają fale dźwiękowe o wysokiej częstotliwości (niesłyszalne dla człowieka), a następnie mierzą, po jakim czasie wracają odbite od obiektu.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [const TextSpan(text: "Z tego system oblicza:")],
              ),
              const SizedBox(height: 10),
              _buildSimpleBulletedList([
                "odległość do przeszkody,",
                "jej pozycję,",
                "ewentualną zmianę odległości w czasie (zbliżanie się lub oddalanie).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                color: Colors.grey.shade600,
                children: [
                  const TextSpan(
                    text:
                        "W samochodach montuje się je zwykle w zderzakach - z przodu i z tyłu.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Z czego składa się czujnik ultradźwiękowy?"),
              const SizedBox(height: 20),
              PointListWidget(
                title: "Nadajnik",
                description:
                    "Generuje krótkie impulsy ultradźwiękowe (często 40-50 kHz).",
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Odbiornik",
                description: "Odbiera fale odbite od bliskich obiektów.",
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Przetwornik piezoelektryczny",
                description:
                    "Pełni funkcję zarówno głośnika, jak i mikrofonu - w zależności od trybu pracy.",
              ),
              const SizedBox(height: 10),
              PointListWidget(
                title: "Jednostka obliczeniowa",
                description:
                    "Mierzy czas powrotu fali i przelicza go na odległość.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Jak działają ultradźwięki? - krok po kroku"),
              const SizedBox(height: 20),

              NumberListWidget(
                number: 1,
                title: "Emisja impulsu",
                description:
                    "Nadajnik wysyła falę ultradźwiękową w kierunku przestrzeni wokół auta.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 2,
                title: "Odbicie od obiektu",
                description:
                    "Fala trafia na przeszkodę — np. słupek, ścianę, inny samochód — i wraca do odbiornika.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 3,
                title: "Pomiar czasu powrotu",
                description:
                    "System mierzy, ile czasu zajęła „podróż” fali w obie strony.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 4,
                title: "Obliczenie odległości",
                description:
                    "Na podstawie prędkości dźwięku w powietrzu obliczana jest odległość do przeszkody.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 5,
                title: "Ostrzeganie kierowcy lub systemu autonomicznego",
                description:
                    "Im krótsza odległość, tym szybciej pojawiają się sygnały dźwiękowe lub odpowiednie manewry układu parkowania.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Ultradźwięki w systemach parkowania"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [const TextSpan(text: "Jak pomagają?")],
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              _buildSimpleBulletedList([
                "niskie przeszkody (np. krawężniki),",
                "słupki i barierki,",
                "narożniki innych samochodów,",
                "blisko stojących pieszych,",
                "obiekty niewidoczne w kamerze (bardzo blisko zderzaka).",
              ]),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(text: "W jakich systemach są używane?"),
                ],
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              _buildSimpleBulletedList([
                "Park Assist - prowadzenie kierowcy sygnałami dźwiękowymi.",
                "Auto Park - automatyczne parkowanie równoległe lub prostopadłe.",
                "Manewrowanie przy małej prędkości w autonomii - omijanie przeszkód podczas jazdy w garażu lub parkingach.",
              ]),
              const SizedBox(height: 20),

              SectionTitle(title: "Zalety ultradźwięków"),
              const SizedBox(height: 20),
              TextIconWidget(
                icon: Icons.directions_car_filled_outlined,
                text: "Bardzo dobre wykrywanie bliskich obiektów (0,2 - 4 m).",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.price_check_outlined,
                text: "Niska cena i duża niezawodność.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.dark_mode_outlined,
                text:
                    "Niezależność od światła — działają w nocy i przy oślepieniu słońcem.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.sync_outlined,
                text: "Prosta integracja z kamerami i radarami.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.my_location_outlined,
                text:
                    "Idealne do precyzyjnych manewrów w ciasnych przestrzeniach.",
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

  Widget _buildSimpleBulletedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 8.0, right: 8.0),
                child: Icon(Icons.circle, size: 6, color: Colors.blue),
              ),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
