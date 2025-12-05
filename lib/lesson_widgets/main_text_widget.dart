import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  final List<TextSpan> children;
  final Color? color;
  const MainTextWidget({super.key, required this.children, this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style.copyWith(
          fontSize: 16,
          height: 1.5,
          color: color ?? Colors.black,
        ),
        children: children,
      ),
    );
  }
}
