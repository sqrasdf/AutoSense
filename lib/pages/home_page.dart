import 'package:autosense/widgets/course_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   // backgroundColor: const Color(0xFFFFFF),
    //   backgroundColor: Color.fromRGBO(240, 240, 240, 255),
    //   body: SafeArea(
    //     child: const Center(
    //       // child: Padding(
    //       // padding: EdgeInsets.all(2.0),
    //       child: CourseCard(
    //         title: "AutoSense",
    //         description:
    //             "Poznaj tajniki systemów ADAS i autonomicznych pojazdów",
    //         progress: 0.12,
    //         completedModules: 3,
    //         totalModules: 25,
    //       ),
    //       // ),
    //     ),
    //   ),
    //   bottomNavigationBar: NavigationBar(
    //     destinations: const <Widget>[
    //       NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    //       NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
    //     ],
    //   ),
    // );
    return SafeArea(
      child: const Center(
        // child: Padding(
        // padding: EdgeInsets.all(2.0),
        child: CourseCard(
          title: "AutoSense",
          description: "Poznaj tajniki systemów ADAS i autonomicznych pojazdów",
          progress: 0.12,
          completedModules: 3,
          totalModules: 25,
        ),
        // ),
      ),
    );
  }
}
