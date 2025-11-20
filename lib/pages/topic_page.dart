import 'package:flutter/material.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  String lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ullamcorper aliquet ligula, eget auctor tellus lacinia eu. Ut non maximus massa, elementum porttitor sapien. Quisque malesuada, eros vitae bibendum consequat, dolor nisl aliquam nulla, lobortis congue tellus lacus sit amet tellus. Maecenas quis justo quis tellus faucibus fermentum sed eget orci. Vivamus condimentum suscipit quam nec consequat. Mauris odio metus, fringilla consectetur felis non, egestas blandit orci. Proin varius lectus nec nunc efficitur malesuada. Integer eleifend maximus aliquam. Morbi vestibulum consequat pulvinar. Fusce vulputate erat at mauris placerat, non venenatis est facilisis. Vestibulum convallis lacinia lacus vitae gravida. Proin pellentesque, sem sed viverra scelerisque, diam turpis vestibulum ligula, nec ultrices lectus quam sed urna. Duis gravida, nisi sit amet congue finibus, dui elit posuere ligula, eu dictum est erat id justo. Duis et ligula in orci tempus pellentesque eu et elit. Nunc lacus risus, aliquam sit amet nulla posuere, pellentesque malesuada ante. Quisque semper eros a sollicitudin ultricies.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shadowColor: Colors.black,
        // backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              padding: EdgeInsets.all(6),
              child: Text(
                "Lekcja 1",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Podstawy LIDAR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),

              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.radar, size: 70),
                  SizedBox(width: 40),
                  Text(
                    "Title",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(lorem, style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
