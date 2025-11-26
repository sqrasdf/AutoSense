import 'package:autosense/widgets/course_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Center(
        child: CourseCard(
          title: "AutoSense",
          description: "Poznaj tajniki systemów ADAS i autonomicznych pojazdów",
          progress: 0.12,
          completedModules: 3,
          totalModules: 25,
        ),
        // ),
      ),
    );
  }
}
