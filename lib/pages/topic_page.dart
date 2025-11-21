import 'package:autosense/lesson_widgets/intro_panel.dart';
import 'package:autosense/lesson_widgets/title_panel.dart';
import 'package:flutter/material.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 70,
      //   shadowColor: Colors.black,
      //   // backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(8),
      //           color: Colors.grey.shade300,
      //         ),
      //         padding: EdgeInsets.all(6),
      //         child: Text(
      //           "Lekcja 1",
      //           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       Text(
      //         "Podstawy LIDAR",
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //     ],
      //   ),
      //   leading: Icon(Icons.arrow_back),
      // ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   // height: 70,
              //   padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              //   // decoration: BoxDecoration(color: Colors.pink.shade100),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         onTap: () => Navigator.pop(context),
              //         child: Icon(Icons.arrow_back),
              //       ),
              //       SizedBox(width: 25),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(14),
              //               color: Colors.grey.shade300,
              //             ),
              //             padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
              //             child: Text(
              //               "Lekcja 1",
              //               style: TextStyle(
              //                 fontSize: 12,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ),
              //           SizedBox(height: 10),
              //           Text(
              //             "Podstawy LIDAR",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              TitlePanel(title: "Podstawy LIDAR", lessonNumber: 1),
            ],
          ),
        ),
      ),
    );
  }
}
