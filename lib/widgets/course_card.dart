// ignore_for_file: unused_import

import 'package:autosense/pages/lesson_page.dart';
import 'package:autosense/widgets/module_card.dart';
import 'package:autosense/widgets/topic_card.dart';
import 'package:flutter/material.dart';
import 'course_header.dart';
import 'progress_bar.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final int completedModules;
  final int totalModules;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.completedModules,
    required this.totalModules,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseHeader(title: title, description: description),
            const SizedBox(height: 20),
            ProgressBar(
              progress: progress,
              completedModules: completedModules,
              totalModules: totalModules,
            ),
            const SizedBox(height: 20),
            Text("Moduły edukacyjne"),
            const SizedBox(height: 20),
            ModuleCard(
              icon: Icons.radar,
              title: 'Sensory pojazdu',
              subtitle: 'Poznaj radary, LIDAR, kamery i ultradźwięki',
              onTap: () {
                debugPrint('Otwieram Sensory pojazdu');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LessonPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            ModuleCard(
              icon: Icons.scatter_plot,
              title: 'Strategie jazdy autonomicznej',
              subtitle: 'Algorytmy podejmowania decyzji (omijanie, hamowanie)',
              onTap: () {
                debugPrint('Otwieram Strategie jazdy autonomicznej');
              },
            ),
            const SizedBox(height: 20),
            ModuleCard(
              icon: Icons.camera_alt,
              title: 'Fuzja danych',
              subtitle: 'Dowiedz się jak system łączy dane z różnych czujników',
              onTap: () {
                debugPrint('Otwieram Fuzję danych');
              },
            ),
            const SizedBox(height: 20),
            ModuleCard(
              icon: Icons.speed,
              title: 'Poziomy autonomii',
              subtitle: 'SAE J3016 - Poziomy 0-5',
              onTap: () {
                debugPrint('Otwieram Poziomy autonomii');
              },
            ),
            const SizedBox(height: 20),
            ModuleCard(
              icon: Icons.traffic,
              title: 'Symulacja drogowa',
              subtitle: 'Analiza sytuacji na ddrodze z systemem AI',
              onTap: () {
                debugPrint('Otwieram Symuację drogową');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
