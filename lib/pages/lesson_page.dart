import 'package:autosense/widgets/sensor_card.dart';
import 'package:flutter/material.dart';

// class LessonPage extends StatefulWidget {
//   const LessonPage({super.key});

//   @override
//   State<LessonPage> createState() => _LessonPageState();
// }

// class _LessonPageState extends State<LessonPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: Center(child: Text("yoo")));
//   }
// }

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sensory', style: TextStyle(fontSize: 26)),
            SizedBox(height: 20),
            SensorCard(
              icon: Icons.radar,
              iconBackgroundColor: Colors.grey,
              badgeText: "0-250m",
              title: "Radar",
              description:
                  "Detekcja obiektów z przodu pojazdu, pomiar prędkości i odległości. "
                  "Działa w każdych warunkach pogodowych.",
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
