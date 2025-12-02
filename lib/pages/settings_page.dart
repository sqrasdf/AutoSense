import 'package:autosense/widgets/about_card.dart';
import 'package:autosense/widgets/settings_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingsCard(
              icon: Icons.person_outlined,
              iconBackgroundColor: Colors.blue.shade100,
              iconColor: Colors.blue.shade700,
              text: "Profil użytkownika",
            ),
            SizedBox(height: 15),
            SettingsCard(
              icon: Icons.notifications_none_outlined,
              iconBackgroundColor: Colors.green.shade100,
              iconColor: Colors.green.shade700,
              text: "Powiadomienia",
            ),
            SizedBox(height: 15),
            SettingsCard(
              icon: Icons.info_outlined,
              iconBackgroundColor: Colors.grey.shade300,
              iconColor: Colors.grey.shade700,
              text: "O aplikacji",
            ),

            SizedBox(height: 15),
            AboutCard(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
