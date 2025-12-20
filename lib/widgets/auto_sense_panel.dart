import 'package:autosense/pages/settings_page.dart';
import 'package:flutter/material.dart';

class AutoSensePanel extends StatelessWidget {
  final String title;
  final String description;

  const AutoSensePanel({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 48, 146, 243),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Icon(Icons.radar, color: Colors.white, size: 36),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.black87, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Color(0xFFE0F0FF),
                radius: 24,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.blueAccent,
                  size: 27,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }
}
