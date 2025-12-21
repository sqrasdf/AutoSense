import 'package:autosense/pages/1_sensors/lesson_page_radar.dart';
import 'package:flutter/material.dart';

class LessonNavigationButtons extends StatelessWidget {
  final Widget? nextPageWidget;
  const LessonNavigationButtons({super.key, this.nextPageWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              print("przycisk wstecz");
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            child: Text(
              "Wstecz",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 7, 126, 252),
                  Color.fromARGB(255, 1, 88, 181),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                debugPrint("przejście do następnej lekcji");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nextPageWidget ?? LessonPageRadar(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.transparent, // Ważne: usuwa domyślne tło
                shadowColor: Colors.transparent, // Usuwa cień
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
              child: Text(
                "Następna lekcja",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
