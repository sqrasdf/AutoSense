import 'package:autosense/pages/1_sensors/lesson_page_camera.dart';
import 'package:autosense/pages/1_sensors/lesson_page_lidar.dart';
import 'package:autosense/pages/1_sensors/lesson_page_radar.dart';
import 'package:autosense/pages/1_sensors/lesson_page_ultrasounds.dart';
import 'package:autosense/pages/2_strategies/lesson_page_algorithms.dart';
import 'package:autosense/pages/2_strategies/strategy_card.dart';
import 'package:autosense/widgets/sensor_card.dart';
import 'package:flutter/material.dart';

class LessonsPageStrategies extends StatelessWidget {
  const LessonsPageStrategies({super.key});

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
              StrategyCard(
                icon: Icons.psychology,
                iconBackgroundColor: Colors.lightBlueAccent,
                title: "Algorytmy podejmowania decyzji",
                description:
                    "Wprowadzenie do warstwy decyzyjnej pojazdu autonomicznego, która określa, jak system wybiera kolejne działania.",
                lesson: LessonPageAlgorithms(),
              ),
              SizedBox(height: 20),
              StrategyCard(
                icon: Icons.account_tree,
                iconBackgroundColor: Colors.lightBlue,
                title: "Przykłady strategii jazdy",
                description:
                    "Przegląd praktycznych manewrów, prezentujący działanie algorytmów w realnych sytuacjach drogowych.",
                lesson: Container(),
              ),
              SizedBox(height: 20),
              StrategyCard(
                icon: Icons.redo,
                iconBackgroundColor: Colors.blue,
                title: "Scenariusze interaktywne",
                description:
                    "Analiza procesu, w którym pojazd wykrywa przeszkodę i wybiera najbezpieczniejszą ścieżkę jej ominięcia.",
                lesson: Container(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
