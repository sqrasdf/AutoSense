import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final int completedModules;
  final int totalModules;

  const ProgressBar({
    super.key,
    required this.progress,
    required this.completedModules,
    required this.totalModules,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2AA7FF), Color(0xFF007BFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Twój postęp",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.emoji_events_outlined, color: Colors.white, size: 35),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "${(progress * 100).toInt()}%",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            color: Colors.white,
            backgroundColor: Colors.white24,
            borderRadius: BorderRadius.circular(5),
            minHeight: 6,
          ),
          const SizedBox(height: 8),
          Text(
            "$completedModules z $totalModules modułów ukończonych",
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
