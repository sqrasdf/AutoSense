import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/point_list_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
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

class LessonPageRealWorldExamples extends StatefulWidget {
  const LessonPageRealWorldExamples({super.key});

  @override
  State<LessonPageRealWorldExamples> createState() =>
      _LessonPageRealWorldExamplesState();
}

class _LessonPageRealWorldExamplesState
    extends State<LessonPageRealWorldExamples> {
  Widget _buildRealWorldTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, width: 1.0),
      columnWidths: const {
        0: FlexColumnWidth(1.8), // Marka/System
        1: FlexColumnWidth(1.0), // Poziom SAE
        2: FlexColumnWidth(3.5), // Co potrafi?
      },
      children: [
        // Nagłówek
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            _buildTableHeaderCell('Marka / System'),
            _buildTableHeaderCell('Poziom SAE'),
            _buildTableHeaderCell('Co potrafi?'),
          ],
        ),
        // Tesla
        TableRow(
          children: [
            _buildTableCell('Tesla FSD / Autopilot', isBold: true),
            _buildTableCell('2'),
            _buildTableCell('jazda częściowo autonomiczna, kierowca nadzoruje'),
          ],
        ),
        // Mercedes Drive Pilot
        TableRow(
          children: [
            _buildTableCell('Mercedes Drive Pilot', isBold: true),
            _buildTableCell('3'),
            _buildTableCell(
              'jazda autonomiczna w ograniczonych warunkach, bez nadzoru wzrokowego',
            ),
          ],
        ),
        // Waymo Robotaxi
        TableRow(
          children: [
            _buildTableCell('Waymo Robotaxi', isBold: true),
            _buildTableCell('4'),
            _buildTableCell(
              'pełna jazda autonomiczna bez kierowcy, w określonych strefach',
            ),
          ],
        ),
        // Poziom 5
        TableRow(
          children: [
            _buildTableCell('Brak przykładów', isBold: true),
            _buildTableCell('5'),
            _buildTableCell('poziom 5 nie istnieje jeszcze komercyjnie'),
          ],
        ),
      ],
    );
  }

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
                title:
                    "Przykłady realnych aut + Quiz „Jaki to poziom autonomii?”",
                lessonNumber: 13,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),

              SectionTitle(
                title: "Wprowadzenie: autonomia w prawdziwym świecie",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Choć wiele firm reklamuje swoje systemy jako „autopilota”, to faktyczne poziomy autonomii są ściśle zdefiniowane.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [const TextSpan(text: "W tej lekcji uporządkujemy:")],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "które systemy działają na poziomie 2,",
                "które osiągnęły przełomowy poziom 3,",
                "a które testują lub wdrażają poziom 4.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Poziomu 5 nie posiada jeszcze żaden pojazd dostępny na rynku.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SectionTitle(
                title:
                    "Przykłady samochodów i firm — rzeczywiste poziomy autonomii",
              ),
              const SizedBox(height: 20),

              PointListWidget(
                title:
                    "Tesla — poziom 2 (Autopilot / FSD Beta / FSD Supervised)",
                description:
                    "Wymaga pełnego nadzoru kierowcy, trzymania rąk na kierownicy oraz interwencji w nieprzewidzianych sytuacjach. Odpowiedzialność pozostaje na kierowcy. Klasyfikacja to poziom 2 SAE.",
              ),
              const SizedBox(height: 16),

              PointListWidget(
                title: "Mercedes EQS/EQE — poziom 3 (Drive Pilot)",
                description:
                    "Mercedes jako pierwszy uzyskał oficjalną homologację poziomu 3 SAE w niektórych krajach. Umożliwia jazdę w korku na autostradzie bez konieczności patrzenia na drogę (do ok. 60 km/h). Jest to klasyczne „conditional automation”.",
              ),
              const SizedBox(height: 16),

              PointListWidget(
                title: "Waymo — poziom 4 (robotaxi bez kierowcy)",
                description:
                    "Obecnie najbardziej dojrzały system poziomu 4 dostępny komercyjnie. Cechuje go brak kierowcy w kabinie oraz pełny nadzór AI, ale działa tylko w wyznaczonych (zmapowanych) strefach miast. Poza strefą auto nie ruszy.",
              ),
              const SizedBox(height: 16),

              SectionTitle(title: "Podsumowanie przykładów"),
              const SizedBox(height: 20),
              _buildRealWorldTable(),
              const SizedBox(height: 20),

              SectionTitle(
                title: "Interaktywny Quiz: „Jaki to poziom autonomii?”",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Sprawdź, czy potrafisz poprawnie zaklasyfikować poniższe scenariusze do odpowiedniego poziomu autonomii SAE.",
                  ),
                ],
              ),

              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "TODO", // TODO
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const LessonNavigationButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
