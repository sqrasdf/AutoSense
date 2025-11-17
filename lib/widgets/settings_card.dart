import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;

  final String badgeText;
  final String title;
  final String description;

  const SettingsCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.badgeText,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      // child: Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       width: 45,
      //       height: 45,
      //       decoration: BoxDecoration(
      //         color: iconBackgroundColor,
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //       child: Center(
      //         child: Icon(Icons.person, size: 30, color: Colors.white),
      //       ),
      //     ),
      //     SizedBox(width: 10),
      //     Text("Profil użytkownika"),
      //     SizedBox(width: 100),
      //     Icon(Icons.arrow_forward_ios_rounded),
      //   ],
      // ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Icon(
                Icons.person_outline_rounded,
                size: 30,
                color: Colors.blue.shade700,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text("Profil użytkownika"),
          Expanded(child: Container()),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
