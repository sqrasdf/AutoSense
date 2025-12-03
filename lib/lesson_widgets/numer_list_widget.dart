import 'package:flutter/material.dart';

class NumberListWidget extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  const NumberListWidget({
    super.key,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 25,
          height: 25,
          margin: const EdgeInsets.only(right: 12.0, top: 2.0),
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: const TextStyle(
              color: Colors.white, // Kolor numeru biały
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Treść kroku (Tytuł i Opis)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Tytuł kroku (pogrubiony)
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18, // Większy rozmiar niż opis
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              // Opis kroku (normalny tekst, lekko wyszarzony)
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors
                      .grey[800], // Ciemniejszy szary dla lepszej czytelności
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Model Danych dla Kroków ---
class StepItem {
  final int number;
  final String title;
  final String description;

  StepItem({
    required this.number,
    required this.title,
    required this.description,
  });
}

// --- Główny Widget Listy Kroków ---
class NumberedStepList extends StatelessWidget {
  final List<StepItem> steps;

  const NumberedStepList({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: steps.map((step) => _buildStepItem(context, step)).toList(),
      ),
    );
  }

  // Buduje pojedynczy krok
  Widget _buildStepItem(BuildContext context, StepItem step) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0), // Odstęp między krokami
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 25,
            height: 25,
            margin: const EdgeInsets.only(right: 12.0, top: 2.0),
            decoration: const BoxDecoration(
              color: Colors.blue, // Kolor tła niebieski
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${step.number}',
              style: const TextStyle(
                color: Colors.white, // Kolor numeru biały
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Treść kroku (Tytuł i Opis)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Tytuł kroku (pogrubiony)
                Text(
                  step.title,
                  style: const TextStyle(
                    fontSize: 18, // Większy rozmiar niż opis
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                // Opis kroku (normalny tekst, lekko wyszarzony)
                Text(
                  step.description,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors
                        .grey[800], // Ciemniejszy szary dla lepszej czytelności
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
