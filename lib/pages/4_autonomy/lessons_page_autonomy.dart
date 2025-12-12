import 'package:autosense/pages/4_autonomy/autonomy_card.dart';
import 'package:autosense/pages/4_autonomy/lesson_page_autonomy_intro.dart';
import 'package:autosense/pages/4_autonomy/lesson_page_levels_35.dart';
import 'package:flutter/material.dart';

class LessonsPageAutonomy extends StatelessWidget {
  const LessonsPageAutonomy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Strategie jazdy autonomicznej',
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(height: 20),
              AutonomyCard(
                icon: Icons.settings,
                iconBackgroundColor: Colors.lightBlueAccent,
                title:
                    "Czym są poziomy autonomii? (SAE J3016) - poziomy 0 do 2 ",
                description:
                    "Wprowadzenie do warstwy decyzyjnej pojazdu autonomicznego, która określa, jak system wybiera kolejne działania.",
                lesson: LessonPageAutonomyIntro(),
              ),
              SizedBox(height: 20),
              AutonomyCard(
                icon: Icons.directions_car,
                iconBackgroundColor: Colors.lightBlue,
                title: "Poziomy 3-5: jazda autonomiczna i pełna autonomia",
                description:
                    "Wyjaśnienie czym różnią się tryby „warunkowej”, „wysokiej” i „pełnej” autonomii.",
                lesson: LessonPageLevels35(),
              ),
              SizedBox(height: 20),
              AutonomyCard(
                icon: Icons.quiz,
                iconBackgroundColor: Colors.blue,
                title: "Przykłady realnych aut + Quiz interaktywny",
                description:
                    "Przypisanie realnych modeli (Tesla, Waymo, Mercedes EQ), oraz quiz: „Jaki to poziom autonomii?”.",
                lesson: Scaffold(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
