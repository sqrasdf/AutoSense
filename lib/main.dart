// ignore_for_file: unused_import

import 'package:autosense/pages/home_page.dart';
import 'package:autosense/pages/settings_page.dart';
import 'package:autosense/pages/topic_page.dart';
import 'package:autosense/widgets/auto_sense_panel.dart';
import 'package:autosense/widgets/course_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoSense',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(6, 113, 247, 255),
        ),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SafeArea(child: Column(children: [AutoSensePanel()])),
    //   bottomNavigationBar: NavigationBar(
    //     destinations: const <Widget>[
    //       NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    //       NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
    //     ],
    //   ),
    // );

    // const List<Widget> pageOptions = <Widget>[HomePage(), SettingsPage()];

    return MaterialApp(
      title: 'AutoSense Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: Scaffold(
        // backgroundColor: const Color(0xFFFFFF),
        backgroundColor: Color.fromRGBO(240, 240, 240, 255),
        // body: SafeArea(
        //   child: const Center(
        //     // child: Padding(
        //     // padding: EdgeInsets.all(2.0),
        //     child: CourseCard(
        //       title: "AutoSense",
        //       description:
        //           "Poznaj tajniki systemów ADAS i autonomicznych pojazdów",
        //       progress: 0.12,
        //       completedModules: 3,
        //       totalModules: 25,
        //     ),
        //     // ),
        //   ),
        // ),
        body: [HomePage(), SettingsPage(), TopicPage()][selectedPageIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            NavigationDestination(
              icon: Icon(Icons.school),
              label: "Lesson page",
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              selectedPageIndex = index;
              print(selectedPageIndex);
            });
          },
          selectedIndex: selectedPageIndex,
        ),
      ),
    );
  }
}
