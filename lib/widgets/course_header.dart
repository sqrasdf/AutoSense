import 'package:flutter/material.dart';

class CourseHeader extends StatelessWidget {
  final String title;
  final String description;

  const CourseHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFE0F0FF),
          radius: 30,
          child: Icon(Icons.sensors, color: Colors.blueAccent, size: 35),
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
      ],
    );
  }
}
