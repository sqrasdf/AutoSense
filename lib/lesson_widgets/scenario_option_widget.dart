// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ScenarioOptionWidget extends StatefulWidget {
  final String optionText;
  final bool isCorrect;
  bool correctAnswerClicked;
  final int index;
  final void Function(int)? onCorrectAnswer;

  ScenarioOptionWidget({
    required this.optionText,
    this.isCorrect = false,
    this.correctAnswerClicked = false,
    this.onCorrectAnswer,
    required this.index,

    super.key,
  });

  @override
  State<ScenarioOptionWidget> createState() => _ScenarioOptionWidgetState();
}

class _ScenarioOptionWidgetState extends State<ScenarioOptionWidget> {
  Color backgroundColor = Colors.white;
  Color borderColor = Colors.grey.shade300;
  IconData icon = Icons.radio_button_off;
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.correctAnswerClicked) {
          if (widget.isCorrect) {
            widget.onCorrectAnswer!(widget.index);
            setState(() {
              widget.correctAnswerClicked = true;
              backgroundColor = Colors.green.shade50;
              borderColor = Colors.green.shade300;
              icon = Icons.check_circle;
              iconColor = Colors.green;
            });
          } else {
            setState(() {
              backgroundColor = Colors.red.shade50;
              borderColor = Colors.red.shade300;
              icon = Icons.cancel;
              iconColor = Colors.red;
            });
          }
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.optionText,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
