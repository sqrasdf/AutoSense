import 'package:flutter/material.dart';

Widget buildTableHeaderCell(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget buildTableCell(String text, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
      ),
    ),
  );
}
