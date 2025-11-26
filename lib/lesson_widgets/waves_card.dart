import 'package:flutter/material.dart';

class WavesCard extends StatefulWidget {
  const WavesCard({super.key});

  @override
  State<WavesCard> createState() => _WavesCardState();
}

class _WavesCardState extends State<WavesCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF057dcd), Color(0xFF43b0f1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                for (int i = 0; i < 4; i++) _buildWave(delay: i * 0.5),

                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(60, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.waves, color: Colors.white, size: 32),
                  ),
                ),

                animationObjectDots(top: 100, right: 60),
                animationObjectDots(top: -50, right: 30),
                animationObjectDots(top: 60, right: -30),
                animationObjectDots(top: 40, right: 120),
                animationObjectDots(top: -40, right: -70),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget animationObjectDots({required double top, required double right}) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildWave({required double delay}) {
    final progress = ((_controller.value + delay) % 1.0);

    final scale = 1 + progress * 2.5;
    final opacity = (1 - progress).clamp(0.0, 1.0);

    return Transform.scale(
      scale: scale,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withValues(alpha: opacity * 0.4),
            width: 2,
          ),
        ),
      ),
    );
  }
}
