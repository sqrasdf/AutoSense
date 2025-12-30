import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String url;

  const LinkText({super.key, required this.text, required this.url});

  Future<void> _openLink() async {
    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Nie można otworzyć $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _openLink,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 9,
            // decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
