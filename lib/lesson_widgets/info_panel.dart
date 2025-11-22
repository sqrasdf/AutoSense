import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  final String description;

  const InfoPanel({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1.2,
          color: Color.fromARGB(255, 164, 200, 249),
        ),
      ),
      child: Center(child: Text(description, textAlign: TextAlign.center)),
    );
  }
}
