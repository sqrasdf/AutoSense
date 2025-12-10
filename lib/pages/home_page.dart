import 'package:autosense/pages/1_sensors/lessons_page_sensors.dart';
import 'package:autosense/pages/2_strategies/lessons_page_strategies.dart';
import 'package:autosense/pages/3_fusion/lessons_page_fusion.dart';
import 'package:autosense/widgets/auto_sense_panel.dart';
import 'package:autosense/widgets/module_card.dart';
import 'package:autosense/widgets/progress_bar.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSensePanel(
                title: "AutoSense",
                description:
                    "Poznaj tajniki systemów ADAS i autonomicznych pojazdów",
              ),
              const SizedBox(height: 20),
              ProgressBar(
                progress: 0.12,
                completedModules: 3,
                totalModules: 25,
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
                    MaterialPageRoute(
                      builder: (context) => const LessonsPageSensors(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ModuleCard(
                icon: Icons.swap_calls,
                title: 'Strategie jazdy autonomicznej',
                subtitle:
                    'Algorytmy podejmowania decyzji (omijanie, hamowanie)',
                onTap: () {
                  debugPrint('Otwieram Strategie jazdy autonomicznej');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LessonsPageStrategies(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              ModuleCard(
                icon: Icons.camera_alt,
                title: 'Fuzja danych',
                subtitle:
                    'Dowiedz się jak system łączy dane z różnych czujników',
                onTap: () {
                  debugPrint('Otwieram Fuzję danych');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LessonsPageFusion(),
                    ),
                  );
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
                subtitle: 'Analiza sytuacji na drodze z systemem AI',
                onTap: () {
                  debugPrint('Otwieram Symuację drogową');
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
