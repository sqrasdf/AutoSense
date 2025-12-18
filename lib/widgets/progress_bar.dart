import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  // final double progress;
  final int completedModules;
  final int totalModules;

  const ProgressBar({
    super.key,
    // required this.progress,
    required this.completedModules,
    required this.totalModules,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const CircularProgressIndicator();
    // double progress = completedModules / totalModules;

    return StreamBuilder<DocumentSnapshot>(
      // 1. Nasłuchujemy na konkretny dokument użytkownika
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        // Obsługa ładowania
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator();
        }

        // Obsługa błędów lub braku dokumentu
        // if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
        //   return const Text("Brak danych postępu");
        // }

        // 2. Pobieramy dane i rzutujemy na Mapę (unikanie błędu 'Object')
        final userData = snapshot.data!.data() as Map<String, dynamic>?;
        final List<dynamic> progressList =
            userData?['lessonCompletedStatus'] ?? [];

        // 3. Obliczamy statystyki
        int completedCount = progressList
            .where((status) => status == true)
            .length;
        int totalLessons = progressList.isNotEmpty ? progressList.length : 13;
        double progressPercentage = totalLessons > 0
            ? (completedCount / totalLessons)
            : 0.0;

        // 4. Wyświetlamy UI
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
                  Icon(
                    Icons.emoji_events_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "${(progressPercentage * 100).toInt()}%",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progressPercentage,
                color: Colors.white,
                backgroundColor: Colors.white24,
                borderRadius: BorderRadius.circular(5),
                minHeight: 6,
              ),
              const SizedBox(height: 8),
              Text(
                "$completedCount z $totalLessons modułów ukończonych",
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        );
      },
    );
  }
}
