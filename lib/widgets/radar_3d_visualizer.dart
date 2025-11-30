import 'package:flutter/material.dart';

class Radar3DVisualizer extends StatefulWidget {
  const Radar3DVisualizer({super.key});

  @override
  State<Radar3DVisualizer> createState() => _Radar3DVisualizerState();
}

class _Radar3DVisualizerState extends State<Radar3DVisualizer>
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
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _RadarPainter(_controller)),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.2),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.rotate_left, size: 14, color: Colors.redAccent),
                    SizedBox(width: 5),
                    Text(
                      "SYMULACJA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadarPainter extends CustomPainter {
  final Animation<double> animation;

  _RadarPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final horizonY = size.height * 0.3;

    _drawGrid(canvas, size, centerX, horizonY);

    _drawObstacle(canvas, size, centerX, horizonY);

    _drawRadarWaves(canvas, size, centerX, horizonY);
  }

  void _drawGrid(Canvas canvas, Size size, double centerX, double horizonY) {
    final paint = Paint()
      ..color = Colors.blueGrey.withOpacity(0.3)
      ..strokeWidth = 1;

    for (double i = -1; i <= 1; i += 0.25) {
      double bottomX = centerX + (i * size.width * 1.5);
      canvas.drawLine(
        Offset(bottomX, size.height),
        Offset(centerX, horizonY),
        paint,
      );
    }

    double animValue = animation.value;
    for (int i = 0; i < 15; i++) {
      double t = (i + animValue * 2) % 15 / 15;
      double y = horizonY + (size.height - horizonY) * (t * t);

      if (y < size.height) {
        double widthFactor = (y - horizonY) / (size.height - horizonY);
        double halfWidth = (size.width / 2) * (0.2 + widthFactor * 1.5);

        paint.color = Colors.blueGrey.withOpacity(0.3 * t);
        canvas.drawLine(
          Offset(centerX - halfWidth, y),
          Offset(centerX + halfWidth, y),
          paint,
        );
      }
    }
  }

  void _drawObstacle(
    Canvas canvas,
    Size size,
    double centerX,
    double horizonY,
  ) {
    double obstacleY = horizonY + 40;
    double obstacleSize = 30;

    bool isHit = false;
    for (int i = 0; i < 3; i++) {
      double wavePos = (animation.value + i * 0.33) % 1.0;
      if (wavePos > 0.1 && wavePos < 0.2) {
        isHit = true;
      }
    }

    final paint = Paint()
      ..color = isHit ? Colors.redAccent : Colors.grey.shade800
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromCenter(
      center: Offset(centerX, obstacleY),
      width: obstacleSize,
      height: obstacleSize,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX, obstacleY + obstacleSize / 2 + 5),
        width: obstacleSize,
        height: 10,
      ),
      Paint()
        ..color = Colors.black.withOpacity(0.5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5),
    );

    canvas.drawRect(rect, paint);

    canvas.drawRect(
      rect,
      Paint()
        ..color = Colors.white54
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    if (isHit) {
      canvas.drawCircle(
        Offset(centerX, obstacleY),
        obstacleSize * 1.5,
        Paint()
          ..color = Colors.redAccent.withOpacity(0.4)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  void _drawRadarWaves(
    Canvas canvas,
    Size size,
    double centerX,
    double horizonY,
  ) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 3; i++) {
      double t = (animation.value + i * 0.33) % 1.0;

      double y = size.height - (size.height - horizonY) * t;
      double width = size.width * (1.0 - t * 0.6) * 0.8;

      if (t < 0.1) continue;

      paint.color = Colors.redAccent.withOpacity((1.0 - t) * 0.8);

      Path path = Path();
      path.moveTo(centerX - width / 2, y);
      path.quadraticBezierTo(centerX, y - 20 * (1 - t), centerX + width / 2, y);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
