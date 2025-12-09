import 'package:flutter/material.dart';

class PseudocodeWidget extends StatelessWidget {
  final String code;

  const PseudocodeWidget({required this.code, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: SelectableText(
        code,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 14.0,
          color: Colors.blueGrey[800],
          height: 1.4,
        ),
      ),
    );
  }
}
