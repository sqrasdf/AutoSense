import 'package:flutter/material.dart';

class MainTextLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: 16,
              height: 1.5, // Wysokość linii
              color: Colors.black,
            ),
            children: <TextSpan>[
              const TextSpan(text: 'Słowo „radar” pochodzi od angielskiego '),
              const TextSpan(
                text: 'Radio Detection and Ranging',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text:
                    '. Oznacza urządzenie, które wykorzystuje fale radiowe do wykrywania obiektów oraz mierzenia ich odległości i prędkości.',
              ),
            ],
          ),
        ),
        // --- Separacja między akapitami ---
        const SizedBox(height: 16), // Odstęp
        // Drugi akapit (wyszarzony tekst)
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style.copyWith(
              fontSize: 16,
              height: 1.5,
              color: Colors.grey[600], // Kolor szarego tekstu
            ),
            children: <TextSpan>[
              const TextSpan(
                text:
                    'W autonomicznych samochodach stosuje się głównie radary ',
              ),
              TextSpan(
                text: 'FMCW (Frequency Modulated Continuous Wave)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600], // Pogrubienie zachowuje szary kolor
                ),
              ),
              const TextSpan(
                text:
                    ', które są precyzyjne, odporne na złe warunki pogodowe i nadają się do pracy w ruchu.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MainTextWidget extends StatelessWidget {
  final List<TextSpan> children;
  final Color? color;
  const MainTextWidget({super.key, required this.children, this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(
          fontSize: 16,
          height: 1.5, // Wysokość linii
          color: color ?? Colors.black,
        ),
        children: children,
        // children: <TextSpan>[
        //   const TextSpan(text: 'Słowo ,,radar” pochodzi od angielskiego '),
        //   const TextSpan(
        //     text: 'Radio Detection and Ranging',
        //     style: TextStyle(fontWeight: FontWeight.bold),
        //   ),
        //   const TextSpan(
        //     text:
        //         '. Oznacza urządzenie, które wykorzystuje fale radiowe do wykrywania obiektów oraz mierzenia ich odległości i prędkości.',
        //   ),
        // ],
      ),
    );
  }
}
