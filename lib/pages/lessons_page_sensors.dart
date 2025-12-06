import 'package:autosense/pages/lesson_page_camera.dart';
import 'package:autosense/pages/lesson_page_lidar.dart';
import 'package:autosense/pages/lesson_page_radar.dart';
import 'package:autosense/widgets/sensor_card.dart';
import 'package:flutter/material.dart';

class LessonsPageSensors extends StatelessWidget {
  const LessonsPageSensors({super.key});

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
              Text('Sensory', style: TextStyle(fontSize: 26)),
              SizedBox(height: 20),
              SensorCard(
                icon: Icons.radar,
                iconBackgroundColor: Colors.lightBlueAccent,
                badgeText: "0-250m",
                title: "Radar",
                description:
                    "Detekcja obiektów z przodu pojazdu, pomiar prędkości i odległości. "
                    "Działa w każdych warunkach pogodowych.",
                lesson: LessonPageRadar(),
              ),
              SizedBox(height: 20),
              SensorCard(
                icon: Icons.spatial_tracking,
                iconBackgroundColor: Colors.lightBlue,
                badgeText: "0-200m",
                title: "LIDAR",
                description:
                    "Skan 3D otoczeniaza pomocą lasera. Precyzyjne wykrywanie pieszych, rowerzystów i przeszkód.",
                lesson: LessonPageLidar(),
              ),
              SizedBox(height: 20),
              SensorCard(
                icon: Icons.camera,
                iconBackgroundColor: Colors.blue,
                badgeText: "0-150m",
                title: "Kamera",
                description:
                    "Rozpoznawanie pasów ruchu, znaków drogowych i świateł. Analiza obrazu w czasie rzeczywistym.",
                lesson: LessonPageCamera(),
              ),
              SizedBox(height: 20),
              SensorCard(
                icon: Icons.waves,
                iconBackgroundColor: Colors.blueAccent,
                badgeText: "0-5m",
                title: "Ultradźwięki",
                description:
                    "Systemy parkowaniai wykrywanie obiektów w bliskim otoczeniu pojazdu. Pracyzja do centymetra.",
                lesson: LessonPageRadar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
