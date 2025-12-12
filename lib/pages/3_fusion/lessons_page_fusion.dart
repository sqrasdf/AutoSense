import 'package:autosense/pages/3_fusion/fusion_card.dart';
import 'package:autosense/pages/3_fusion/lesson_page_fusion_basics.dart';
import 'package:autosense/pages/3_fusion/lesson_page_fusion_example.dart';
import 'package:autosense/pages/3_fusion/lesson_page_kalman_deep_learning.dart';
import 'package:flutter/material.dart';

class LessonsPageFusion extends StatelessWidget {
  const LessonsPageFusion({super.key});

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
              Text('Fuzja danych', style: TextStyle(fontSize: 26)),
              SizedBox(height: 20),
              FusionCard(
                icon: Icons.merge,
                iconBackgroundColor: Colors.lightBlueAccent,
                title: "Podstawy i cele fuzji danych",
                description:
                    "Wyjaśnienie dlaczego łączy się dane z wielu sensorów i jakie problemy to rozwiązuje",
                lesson: LessonPageFusionBasics(),
              ),
              SizedBox(height: 20),
              FusionCard(
                icon: Icons.sensors,
                iconBackgroundColor: Colors.lightBlue,
                title:
                    "Przykład fuzji LIDAR + Kamera dla dokładniejszego rozpoznanie obiektów",
                description:
                    "Omówienie praktycznego scenariusza i wizualizacji - nakładanie obrazów i „kolorowanie” punktów z LIDARu.",
                lesson: LessonPageFusionExample(),
              ),
              SizedBox(height: 20),
              FusionCard(
                icon: Icons.auto_graph,
                iconBackgroundColor: Colors.blue,
                title:
                    "Metody fuzji: filtr Kalmana, Deep Learning, 3D-2D Matching",
                description:
                    "Zrozumienie, jak technicznie łączy się dane, z przykładami działania.",
                lesson: LessonPageKalmanDeepLearning(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
