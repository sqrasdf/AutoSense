import 'package:flutter/material.dart';

// --- Główny, Reużywalny Widget ---
class TextIconWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const TextIconWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Rozciąga się na całą dostępną szerokość
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ), // Odstęp między kolejnymi elementami
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 18.0,
      ), // Padding wewnątrz karty
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 241, 241),
        borderRadius: BorderRadius.circular(10.0), // Zaokrąglone rogi
        // Lekki cień, jeśli jest potrzebny, można dodać:
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.05),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: const Offset(0, 1),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Ikona z kolorem
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 16), // Odstęp między ikoną a tekstem
          // Tekst
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
