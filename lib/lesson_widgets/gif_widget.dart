import 'package:flutter/material.dart';

class GifWidget extends StatelessWidget {
  final String assetPath;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const GifWidget({
    super.key,
    required this.assetPath,
    this.borderRadius = 12.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius - borderWidth),
        child: Image.asset(assetPath, fit: BoxFit.contain),
      ),
    );
  }
}
