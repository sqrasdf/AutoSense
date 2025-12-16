import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Funkcja, która zapisuje status ukończenia lekcji
Future<void> saveLessonCompletion(String lessonId) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    debugPrint('Błąd: Brak zalogowanego użytkownika.');
    return;
  }

  // Ścieżka do dokumentu: users/[UID]/progress/[lessonId]
  final DocumentReference lessonRef = FirebaseFirestore.instance
      .collection('users')
      // .doc(user.uid); // Używamy UID jako klucza dokumentu użytkownika
      .doc(user.uid) // Używamy UID jako klucza dokumentu użytkownika
      .collection('progress')
      .doc(lessonId);

  // Dane, które chcemy zapisać
  final Map<String, dynamic> dataToSave = {
    'isCompleted': true,
    'completedAt': FieldValue.serverTimestamp(), // Używamy czasu serwera
  };

  try {
    // Używamy set z merge: true, aby utworzyć lub zaktualizować status lekcji
    await lessonRef.set(dataToSave, SetOptions(merge: true));
    debugPrint('Pomyślnie zapisano status ukończenia dla lekcji: $lessonId');
  } catch (e) {
    debugPrint('Błąd zapisu statusu lekcji $lessonId: $e');
  }
}

Future<void> saveLessonCompletionByIndex(
  int lessonIndex,
  int totalLessons,
) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    debugPrint(
      'Błąd: Brak zalogowanego użytkownika. Uwierzytelnienie anonimowe nie powiodło się.',
    );
    return;
  }

  if (lessonIndex < 0 || lessonIndex >= totalLessons) {
    debugPrint(
      'Błąd: Nieprawidłowy numer lekcji (indeks poza zakresem: 0 do ${totalLessons - 1})',
    );
    return;
  }

  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid);

  try {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(userRef);
      final Map<String, dynamic>? userData =
          snapshot.data() as Map<String, dynamic>?;

      List<bool> statusArray;

      if (userData != null && userData['lessonCompletedStatus'] is List) {
        final List<dynamic> lessonStatusDynamic =
            userData['lessonCompletedStatus'] as List<dynamic>;

        statusArray = [];
        for (var item in lessonStatusDynamic) {
          statusArray.add(item == true);
        }
      } else {
        statusArray = [];
      }

      while (statusArray.length < totalLessons) {
        statusArray.add(false);
      }

      statusArray[lessonIndex] = true;

      transaction.set(userRef, {
        'lessonCompletedStatus': statusArray,
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    });

    debugPrint(
      'Pomyślnie zapisano status ukończenia dla lekcji o indeksie: $lessonIndex',
    );
  } catch (e) {
    debugPrint('Błąd zapisu statusu lekcji: [cloud_firestore] $e');
  }
}
