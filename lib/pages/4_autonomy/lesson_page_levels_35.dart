import 'package:autosense/lesson_widgets/bullet_point_lesson.dart';
import 'package:autosense/lesson_widgets/lesson_navigation_buttons.dart';
import 'package:autosense/lesson_widgets/main_text_widget.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/lesson_title_panel.dart';
import 'package:autosense/lesson_widgets/text_icon_widget.dart';
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

class LessonPageLevels35 extends StatefulWidget {
  const LessonPageLevels35({super.key});

  @override
  State<LessonPageLevels35> createState() => _LessonPageLevels35State();
}

class _LessonPageLevels35State extends State<LessonPageLevels35> {
  Widget _buildSummaryTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey[300]!, width: 1.0),
      columnWidths: const {
        0: FlexColumnWidth(1.0),
        1: FlexColumnWidth(3.0),
        2: FlexColumnWidth(2.5),
        3: FlexColumnWidth(3.0),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey[100]),
          children: [
            _buildTableHeaderCell('Poziom'),
            _buildTableHeaderCell('Kto prowadzi?'),
            _buildTableHeaderCell('Czy trzeba nadzorować?'),
            _buildTableHeaderCell('Gdzie działa?'),
          ],
        ),
        // Poziom 3
        TableRow(
          children: [
            _buildTableCell('3', isBold: true),
            _buildTableCell('Auto (w ograniczonych warunkach)'),
            _buildTableCell('Tak, w gotowości'),
            _buildTableCell('Autostrady, korki'),
          ],
        ),
        // Poziom 4
        TableRow(
          children: [
            _buildTableCell('4', isBold: true),
            _buildTableCell('Auto (bez nadzoru)'),
            _buildTableCell('Nie'),
            _buildTableCell('Wyznaczone obszary miast'),
          ],
        ),
        // Poziom 5
        TableRow(
          children: [
            _buildTableCell('5', isBold: true),
            _buildTableCell('Auto w pełni'),
            _buildTableCell('Nie'),
            _buildTableCell('Wszędzie'),
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
                title: "Poziomy 3–5: jazda autonomiczna i pełna autonomia",
                lessonNumber: 11,
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 10),

              SectionTitle(title: "Wprowadzenie: od wsparcia do autonomii"),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "W tej lekcji przechodzimy od „asystentów kierowcy” (poziomy 0-2) do prawdziwej autonomii, gdzie system przejmuje coraz większą część odpowiedzialności za prowadzenie pojazdu.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(text: "Poziomy 3, 4 i 5 określane są jako: "),
                  const TextSpan(
                    text: "Automated Driving System (ADS)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        ". Są to systemy, które same prowadzą pojazd, a kierowca może (zależnie od poziomu) nawet przestać nadzorować drogę.",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "W miarę przechodzenia na kolejne poziomy:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "auto przejmuje coraz więcej zadań,",
                "rośnie zakres sytuacji, w których system sam prowadzi,",
                "rośnie odpowiedzialność AI za decyzje,",
                "maleje rola kierowcy — aż do całkowitego wyłączenia.",
              ]),
              const SizedBox(height: 20),

              SectionTitle(
                title:
                    "Poziom 3 — Autonomia warunkowa (Conditional Automation)",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "Tu zaczyna się prawdziwa autonomiczna jazda, ale jeszcze w ",
                  ),
                  const TextSpan(
                    text: "ograniczonych warunkach.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Co potrafi auto na poziomie 3?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "prowadzić pojazd w określonych warunkach (tzw. ODD - Operational Design Domain),",
                "podejmować decyzje w dynamicznych sytuacjach,",
                "hamować, omijać przeszkody, ruszać i zatrzymywać się,",
                "monitorować otoczenie zamiast kierowcy.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Ograniczenia:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Kierowca musi być w gotowości, choć nie musi cały czas patrzeć na drogę.",
                "System poprosi kierowcę o przejęcie kontroli, gdy warunki przestają pasować (np. koniec autostrady).",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykłady realnych systemów poziomu 3:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Mercedes Drive Pilot (w wybranych krajach),",
                "Honda Sensing Elite (w Japonii).",
              ]),
              // [MIEJSCE NA ANIMACJĘ - Auto autonomicznie jedzie, kierowca dostępny]
              const SizedBox(height: 20),

              // Poziom 4 — Wysoka autonomia (High Automation)
              SectionTitle(
                title: "Poziom 4 — Wysoka autonomia (High Automation)",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "To już jazda autonomiczna, ale… tylko w ",
                  ),
                  const TextSpan(
                    text: "wyznaczonych obszarach i sytuacjach.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Co potrafi auto poziomu 4?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Samodzielnie prowadzi w określonych strefach (np. centrum miasta, autostrady, kampusy).",
                "Nie wymaga kierowcy do nadzoru — nie trzeba mieć rąk na kierownicy, ani patrzeć na drogę.",
                "Jeśli system nie może kontynuować jazdy, potrafi wykonać bezpieczny stop bez pomocy człowieka.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Ograniczenia:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Autonomia działa tylko tam, gdzie system został „dopuszczony”.",
                "Poza tym obszarem auto może nie ruszyć lub poprosi o kierowcę.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Przykłady poziomu 4:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "Waymo (robotaxi, niektóre miasta USA),",
                "Cruise (robotaxi),",
                "autonomiczne shuttle busy w kampusach.",
              ]),
              // [MIEJSCE NA ANIMACJĘ - Robotaxi jedzie po mieście, pasażerowie relaksują się]
              const SizedBox(height: 20),

              // Poziom 5 — Pełna autonomia (Full Automation)
              SectionTitle(
                title: "Poziom 5 — Pełna autonomia (Full Automation)",
              ),
              const SizedBox(height: 20),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "To docelowy, najwyższy poziom.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        " Pełne autonomiczne prowadzenie w każdych warunkach, przez cały czas.",
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Co potrafi poziom 5?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              buildSimpleBulletedList([
                "Auto prowadzi samo bez żadnych ograniczeń,",
                "Kierowca nie jest potrzebny — nie musi istnieć kierownica ani pedały,",
              ]),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "System radzi sobie:",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              buildSimpleBulletedList([
                "w ruchu miejskim,",
                "na autostradach,",
                "w deszczu, śniegu, nocy,",
                "w każdej sytuacji drogowej.",
              ]),
              const SizedBox(height: 16),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text: "Ograniczenia:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              TextIconWidget(
                icon: Icons.done_all,
                text: "Brak — poziom 5 nie wymaga człowieka w kokpicie.",
              ),
              const SizedBox(height: 10),
              MainTextWidget(
                children: [
                  const TextSpan(
                    text:
                        "To poziom, którego jeszcze nie osiągnięto w komercyjnych pojazdach, ale jest to kierunek rozwoju branży.",
                  ),
                ],
              ),
              // [MIEJSCE NA ANIMACJĘ - Auto bez kierownicy w trudnych warunkach]
              const SizedBox(height: 20),

              // Podsumowanie różnic
              SectionTitle(title: "Podsumowanie różnic"),
              const SizedBox(height: 20),
              _buildSummaryTable(),
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
}
