import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatinonPanel extends StatefulWidget {
  const AnimatinonPanel({super.key});

  @override
  State<AnimatinonPanel> createState() => _AnimatinonPanelState();
}

class _AnimatinonPanelState extends State<AnimatinonPanel>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    // duration: const Duration(seconds: 0.01),
    duration: const Duration(milliseconds: 10000),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget circle = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(child: Text("Yoo")),
    );
    // return circle;
    return Container(
      child: AnimatedBuilder(
        animation: _controller,
        child: circle,
        builder: (BuildContext context, Widget? child) => Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        ),
      ),
    );
  }
}
