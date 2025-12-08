import 'package:flutter/material.dart';

class BulletPointLesson extends StatelessWidget {
  final String text;
  const BulletPointLesson({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Niebieska kropka
        const Padding(
          padding: EdgeInsets.only(top: 8.0, right: 8.0),
          child: Icon(Icons.circle, size: 6, color: Colors.blue),
        ),
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
    );
  }
}

Widget buildSimpleBulletedList(List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 8.0, right: 8.0),
              child: Icon(Icons.circle, size: 6, color: Colors.blue),
            ),
            Expanded(
              child: Text(
                item,
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
    }).toList(),
  );
}
