import 'package:autosense/widgets/settings_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SettingsCard(icon: Icons.abc, title: "title", subtitle: "subtitle"),
            SettingsCard(
              icon: Icons.personal_video_sharp,
              iconBackgroundColor: Colors.blue.shade100,
              badgeText: "badgeText",
              title: "title",
              description: "description",
            ),
          ],
        ),
      ),
    );
  }
}
