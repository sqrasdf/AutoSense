import 'package:flutter/material.dart';

class AutoSensePanel extends StatelessWidget {
  const AutoSensePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(77, 164, 234, 255),
              ),
              child: Icon(Icons.radar, size: 40, color: Colors.white),
            ),
            Text("AutoSense"),
          ],
        ),
        Text("Poznaj tajniki systemów ADAS i autonomiczncyh pojazdów"),
      ],
    );
  }
}
