import 'package:autosense/lesson_widgets/info_panel.dart';
import 'package:autosense/lesson_widgets/intro_panel.dart';
import 'package:autosense/lesson_widgets/section_title.dart';
import 'package:autosense/lesson_widgets/title_panel.dart';
import 'package:autosense/lesson_widgets/waves_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LessonPageRadar extends StatefulWidget {
  const LessonPageRadar({super.key});

  @override
  State<LessonPageRadar> createState() => _TopicPageState();
}

class _TopicPageState extends State<LessonPageRadar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TitlePanel(title: "Podstawy działania radarów", lessonNumber: 1),

              Divider(),

              SizedBox(height: 20),

              IntroPanel(
                title: "Jak działają radary?",
                icon: Icons.radar,
                description:
                    "Poznaj fundamenty technologii, która rewolucjonizuje autonomiczne pojazdy.",
              ),

              SizedBox(height: 20),

              WavesCard(),

              SizedBox(height: 30),

              SectionTitle(title: "Wprowadzenie"),

              SizedBox(height: 20),

              InfoPanel(
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/R.json',
                    ),
                    Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                    ),
                    Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/D.json',
                    ),
                    Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
                    ),
                    Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/R.json',
                    ),
                  ],
                ),
              ),

              Lottie.asset("assets/car_driving.json"),
            ],
          ),
        ),
      ),
    );
  }
}
