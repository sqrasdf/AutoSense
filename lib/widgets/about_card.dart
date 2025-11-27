import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF0D86FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(Icons.radar, color: Colors.white, size: 40),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "AutoSense",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 4),

          const Text(
            "Wersja 1.0.0",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 12),

          const Text(
            "Aplikacja edukacyjna o systemach ADAS i autonomii pojazdów",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF5A5A5A),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
