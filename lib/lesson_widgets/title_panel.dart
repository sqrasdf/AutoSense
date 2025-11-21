import 'package:flutter/material.dart';

class TitlePanel extends StatelessWidget {
  final String title;
  final int lessonNumber;

  const TitlePanel({
    super.key,
    required this.title,
    required this.lessonNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 70,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      // decoration: BoxDecoration(color: Colors.pink.shade100),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.grey.shade300,
                ),
                padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Text(
                  "Lekcja $lessonNumber",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
