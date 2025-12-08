import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/numer_list_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
import 'package:flutter/material.dart';

class LessonPageCamera extends StatefulWidget {
  const LessonPageCamera({super.key});

  @override
  State<LessonPageCamera> createState() => _LessonPageCameraState();
}

class _LessonPageCameraState extends State<LessonPageCamera> {
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
                title: "Kamera w pojeździe autonomicznym",
                lessonNumber: 3,
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
                        "Kamery to „oczy” autonomicznego pojazdu. Dostarczają szczegółowego obrazu otoczenia i pozwalają wykrywać elementy, których radar czy LIDAR nie widzą tak dobrze - zwłaszcza kolorów, kształtów, napisów i drobnych detali.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Dzięki kamerom samochód potrafi rozpoznawać linie na jezdni, znaki drogowe, sygnalizację świetlną oraz wiele innych elementów niezbędnych do bezpiecznej jazdy.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Czym jest kamera w autonomicznym pojeździe?",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Kamera samochodowa to zaawansowany sensor optyczny działający podobnie do ludzkiego oka. Przechwytuje obraz sceny przed pojazdem i zamienia go na dane, które następnie analizuje komputer pokładowy.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "W autonomii stosuje się najczęściej:"),
                ],
              ),
              const SizedBox(height: 16),

              BulletPointLesson(
                text: "kamery RGB - kolorowe kamery o wysokiej rozdzielczości,",
              ),
              SizedBox(height: 10),
              BulletPointLesson(
                text:
                    "kamery szerokokątne - do obserwacji bocznych pasów i skrzyżowań,",
              ),
              SizedBox(height: 10),
              BulletPointLesson(
                text:
                    "kamery stereo - które potrafią szacować głębokość (odległość).",
              ),
              SizedBox(height: 20),

              SectionTitle(title: "Z czego składa się system kamerowy?"),
              const SizedBox(height: 20),

              PointListWidget(
                title: "Obiektyw",
                description:
                    "Skupia światło i decyduje o kącie widzenia (np. 90°, 120°, 180°).",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Matryca (sensor)",
                description:
                    "Przekształca światło na sygnał elektryczny - powstaje obraz.",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Procesor obrazu",
                description:
                    "Odpowiada za wstępne przetwarzanie: korekcję barw, redukcję szumów, stabilizację.",
              ),
              SizedBox(height: 10),
              PointListWidget(
                title: "Moduły AI / sieci neuronowe",
                description:
                    "Analizują obraz i rozpoznają konkretne obiekty, znaki, czy linie.",
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Rozpoznawanie pasów ruchu"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [const TextSpan(text: "Jak kamera „widzi” pasy?")],
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Linie na jezdni mają charakterystyczny kolor i kształt, dzięki czemu algorytmy mogą je śledzić obraz po obrazie.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "W procesie wykorzystywane są m.in.:"),
                ],
              ),
              const SizedBox(height: 16),
              _buildSimpleBulletedList([
                "filtracja kolorów,",
                "detekcja krawędzi (np. Canny),",
                "transformacje perspektywy (widok „z góry”),",
                "sieci neuronowe uczone na obrazach dróg.",
              ]),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [const TextSpan(text: "Co kamera wykrywa?")],
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              _buildSimpleBulletedList([
                "Położenie pasów względem samochodu",
                "Zakręty i krzywiznę drogi",
                "Zanikanie lub słabą widoczność pasów",
                "Linie ciągłe i przerywane",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(
                color: Colors.grey.shade600,
                children: [
                  const TextSpan(
                    text:
                        "Na podstawie tego pojazd może utrzymać tor jazdy lub ostrzec kierowcę.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Rozpoznawanie znaków drogowych"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Dlaczego kamera jest tu kluczowa?"),
                ],
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Tylko kamera potrafi odczytać kolor, kształt i symbol - co jest niezbędne do identyfikacji znaków.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [const TextSpan(text: "Jak to działa?")],
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "System AI analizuje obraz klatka po klatce i porównuje wykryte obiekty z wzorcami znaków, np.:",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSimpleBulletedList([
                "ograniczenie prędkości,",
                "stop,",
                "zakaz wyprzedzania,",
                "nakazy,",
                "znaki informacyjne.",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(
                color: Colors.grey.shade600,
                children: [
                  const TextSpan(text: "Najczęściej używane są sieci "),
                  const TextSpan(
                    text: "CNN (Convolutional Neural Networks)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: ", trenowane na tysiącach zdjęć z dróg.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Kroki rozpoznawania znaków"),
              const SizedBox(height: 20),
              NumberListWidget(
                number: 1,
                title: "Detekcja potencjalnego znaku",
                description:
                    "Wyszukiwanie okręgów, trójkątów, prostokątów na obrazie.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 2,
                title: "Wycięcie fragmentu obrazu",
                description: "Izolacja obiektu znaku.",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 3,
                title: "Klasyfikacja znaku przez model AI",
                description:
                    "Identyfikacja typu znaku przez sieć neuronową (CNN).",
              ),
              const SizedBox(height: 25),
              NumberListWidget(
                number: 4,
                title: "Aktualizacja ograniczeń w systemie",
                description:
                    "Wgranie informacji o ograniczeniu prędkości lub zasadach ruchu do systemu pojazdu.",
              ),
              // [MIEJSCE NA ANIMACJĘ]
              const SizedBox(height: 20),

              // 6. Zalety kamer w autonomicznych pojazdach
              SectionTitle(title: "Zalety kamer w autonomicznych pojazdach"),
              const SizedBox(height: 20),

              // Lista ikon (TextIconWidget)
              TextIconWidget(
                icon: Icons.details_outlined,
                text: "Bardzo szczegółowy obraz otoczenia.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.attach_money,
                text: "Niskie koszty komponentów.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.traffic_outlined,
                text: "Kluczowe do rozpoznawania znaków, świateł i pasów.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.visibility_outlined,
                text:
                    "Działają podobnie jak ludzkie oko, więc naturalnie interpretują drogę.",
              ),
              const SizedBox(height: 5),
              TextIconWidget(
                icon: Icons.all_inclusive_outlined,
                text:
                    "Współpracują z radarami i LIDARem, tworząc pełny obraz sytuacji.",
              ),
              const SizedBox(height: 20),

              // Przyciski nawigacyjne
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
