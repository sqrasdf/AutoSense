import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/pages/2_strategies/pseudocode_widget.dart';
import 'package:flutter/material.dart';

class LessonPageExamples extends StatefulWidget {
  const LessonPageExamples({super.key});

  @override
  State<LessonPageExamples> createState() => _LessonPageScenariosState();
}

class SummaryRow {
  final String scenario;
  final String priority;
  final String action;
  SummaryRow({
    required this.scenario,
    required this.priority,
    required this.action,
  });
}

class _LessonPageScenariosState extends State<LessonPageExamples> {
  // Model dla wiersza w tabeli podsumowującej

  final List<SummaryRow> summaryData = [
    SummaryRow(
      scenario: 'Omijanie przeszkody',
      priority: 'średni, wysoki',
      action: 'detekcja obiektu, sprawdzenie sąsiednich pasów, manewr',
    ),
    SummaryRow(
      scenario: 'Hamowanie awaryjne',
      priority: 'bardzo wysoki',
      action: 'natychmiastowe hamowanie, ABS, ostrzeganie',
    ),
    SummaryRow(
      scenario: 'Jazda w korku',
      priority: 'niski',
      action: 'płynne ruszanie, hamowanie, trzymanie dystansu',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 25;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LessonTitlePanel(
                title: "Przykłady Zachowania Pojazdu Autonomicznego",
                lessonNumber: 5,
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
                        "W tej lekcji przeanalizujemy trzy klasyczne scenariusze, które każdy autonomiczny pojazd musi obsłużyć. Każdy przykład przedstawia warunki podejmowania decyzji, algorytmy reakcji, oraz logikę sterowania.",
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Omijanie przeszkody
              SectionTitle(title: "Omijanie przeszkody"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Cel:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        " Bezpiecznie minąć obiekt pojawiający się na torze jazdy.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Sygnały wejściowe (przykładowe):",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Lidar wykrywa przeszkodę w odległości < 10 m",
                "Kamera potwierdza obiekt",
                "Wolne miejsce w lewym/prawym pasie (dane z radarów bocznych)",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Logika działania (uproszczona):",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Wykrycie przeszkody → decyzja: zahamować czy ominąć?",
                "Sprawdzenie wolnej przestrzeni na sąsiednim pasie.",
                "Jeśli pas jest wolny → wykonaj płynny manewr omijania.",
                "Jeśli pas nie jest wolny → redukcja prędkości i zatrzymanie.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Pseudokod:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              PseudocodeWidget(
                code:
                    'if obstacle_distance < 10:\n    if left_lane_free:\n        steer_left()\n        accelerate()\n    elif right_lane_free:\n        steer_right()\n        accelerate()\n    else:\n        brake()',
              ),
              const SizedBox(height: 20),

              SectionTitle(title: "Hamowanie awaryjne"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Kiedy jest wykonywane:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Nagle pojawiający się obiekt (pieszy, auto)",
                "Nagła zmiana prędkości pojazdu z przodu",
                "Brak możliwości zmiany pasa",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Wymagania:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Reakcja w ułamku sekundy",
                "Maksymalna siła hamowania bez utraty stabilności",
                "Sygnalizacja dla innych pojazdów",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przebieg reakcji:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "System AEB (Automatic Emergency Braking) ocenia ryzyko kolizji.",
                "Jeśli Time To Collision < próg bezpieczeństwa → natychmiastowe hamowanie.",
                "Aktywacja ABS + ostrzeżenie świetlne.",
                "Po zatrzymaniu - analiza możliwości objazdu lub pozostania w miejscu.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Pseudokod:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              PseudocodeWidget(
                code:
                    'if time_to_collision < 1.0:\n    apply_emergency_brake()\n    activate_hazard_lights()',
              ),
              const SizedBox(height: 20),

              // Jazda w korku (stop-and-go)
              SectionTitle(title: "Jazda w korku (stop-and-go)"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Zachowanie pojazdu:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Utrzymywanie minimalnej prędkości (np. 0-15 km/h)",
                "Automatyczne ruszanie i zatrzymywanie",
                "Zachowanie bezpiecznego odstępu",
                "Unikanie gwałtownych manewrów",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Etapy działania:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Radar mierzy odległość do auta z przodu.",
                "Jeśli dystans maleje → powolne hamowanie.",
                "Jeśli auto z przodu rusza → łagodne przyspieszanie.",
                "System utrzymuje auto na środku pasa (lane keeping).",
                "Kierowca nie musi nic robić.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Pseudokod:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              PseudocodeWidget(
                code:
                    'if distance_to_car < safe_distance:\n    brake_softly()\nelif front_car_speed > 0:\n    accelerate_smoothly()\n\nkeep_lane_center()',
              ),
              const SizedBox(height: 20),

              // Podsumowanie
              SectionTitle(title: "Podsumowanie"),
              const SizedBox(height: 20),
              _buildSummaryTable(summaryData),
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

  // Nowy widget pomocniczy do budowy tabeli podsumowującej
  Widget _buildSummaryTable(List<SummaryRow> data) {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, width: 1.0),
      columnWidths: const {
        0: FlexColumnWidth(2.0),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(3.0),
      },
      children: [
        // Nagłówek
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            _buildTableHeaderCell('Scenariusz'),
            _buildTableHeaderCell('Priorytet'),
            _buildTableHeaderCell('Kluczowe działania'),
          ],
        ),
        // Wiersze danych
        ...data.map(
          (row) => TableRow(
            children: [
              _buildTableCell(row.scenario, isBold: true),
              _buildTableCell(row.priority),
              _buildTableCell(row.action),
            ],
          ),
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
}
