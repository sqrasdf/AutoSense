import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;

  // final String badgeText;
  final String text;
  // final String description;

  const SettingsCard({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    // required this.badgeText,
    required this.text,
    // required this.description,
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
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Icon(icon, size: 30, color: iconColor)),
          ),
          SizedBox(width: 10),
          Text(text),
          Expanded(child: Container()),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }
}
