import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class AnimationUltrasound extends StatefulWidget {
  const AnimationUltrasound({super.key});

  @override
  State<AnimationUltrasound> createState() => _AnimationUltrasoundState();
}

class _AnimationUltrasoundState extends State<AnimationUltrasound>
    with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _moveController;
  ui.Image? _carImage;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _moveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _loadImages();
  }

  void _loadImages() {
    AssetImage("assets/car1.png")
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener(
            (ImageInfo info, bool _) {
              if (mounted) {
                setState(() {
                  _carImage = info.image;
                });
              }
            },
            onError: (exception, stackTrace) {
              debugPrint("Error loading car1: $exception");
            },
          ),
        );
  }

  @override
  void dispose() {
    _waveController.dispose();
    _moveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: const Color(0xFF333333),
      child: AnimatedBuilder(
        animation: Listenable.merge([_waveController, _moveController]),
        builder: (context, child) {
          return CustomPaint(
            painter: _UltrasoundPainter(
              waveValue: _waveController.value,
              moveValue: _moveController.value,
              carImage: _carImage,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _UltrasoundPainter extends CustomPainter {
  final double waveValue;
  final double moveValue;
  final ui.Image? carImage;

  _UltrasoundPainter({
    required this.waveValue,
    required this.moveValue,
    required this.carImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double wallY = 30.0;

    final double startCenterY = size.height - 80;
    final double endCenterY = wallY + 20 + 40 + 65;
    final double currentCenterY = ui.lerpDouble(
      startCenterY,
      endCenterY,
      moveValue,
    )!;

    final center = Offset(size.width / 2, currentCenterY);

    // draw wall
    final paintWall = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final paintWallStroke = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final wallRect = Rect.fromCenter(
      center: Offset(size.width / 2, wallY),
      width: size.width * 0.8,
      height: 20,
    );

    final paintLineStroke = Paint()
      ..color = const Color.fromARGB(255, 179, 178, 178)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2 + 90, wallY + 120),
        width: 6,
        height: 260,
      ),
      paintLineStroke,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2 - 90, wallY + 120),
        width: 6,
        height: 260,
      ),
      paintLineStroke,
    );

    canvas.drawRect(wallRect, paintWall);
    canvas.drawRect(wallRect, paintWallStroke);

    // draw car
    if (carImage != null) {
      double carW = 180;
      double carH = 280;
      Rect dstRect = Rect.fromCenter(center: center, width: carW, height: carH);
      Rect srcRect = Rect.fromLTWH(
        0,
        0,
        carImage!.width.toDouble(),
        carImage!.height.toDouble(),
      );
      canvas.drawImageRect(carImage!, srcRect, dstRect, Paint());
    } else {
      // Placeholder
      canvas.drawRect(
        Rect.fromCenter(center: center, width: 50, height: 80),
        Paint()..color = Colors.blue,
      );
    }

    final double carTopY = center.dy - 120; // half height of 130
    final double wallBottomY = wallY + 10; // half height of 20
    final double totalDist = carTopY - wallBottomY;

    final Offset emitterPos = Offset(center.dx, carTopY);

    for (int i = 0; i < 3; i++) {
      double t = (waveValue + (i * 0.33)) % 1.0;

      if (totalDist > 0) {
        _drawPulse(canvas, t, emitterPos, totalDist);
      }
    }
  }

  void _drawPulse(Canvas canvas, double t, Offset emitter, double maxDist) {
    double progress;
    bool isReturning = false;

    if (t < 0.5) {
      progress = t / 0.5;
    } else {
      progress = 1.0 - ((t - 0.5) / 0.5);
      isReturning = true;
    }

    double currentDist = progress * maxDist;
    Offset currentPos = emitter - Offset(0, currentDist);

    final paintWave = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    if (isReturning) {
      paintWave.color = Colors.redAccent.withAlpha(
        ((1.0 - progress) * 255).toInt().clamp(50, 255),
      );
    } else {
      paintWave.color = Colors.greenAccent.withAlpha(
        ((1.0 - progress) * 255).toInt().clamp(50, 255),
      );
    }

    final path = Path();

    if (isReturning) {
      path.moveTo(currentPos.dx - 20, currentPos.dy - 5);
      path.quadraticBezierTo(
        currentPos.dx,
        currentPos.dy + 10,
        currentPos.dx + 20,
        currentPos.dy - 5,
      );
    } else {
      path.moveTo(currentPos.dx - 20, currentPos.dy + 5);
      path.quadraticBezierTo(
        currentPos.dx,
        currentPos.dy - 10,
        currentPos.dx + 20,
        currentPos.dy + 5,
      );
    }

    canvas.drawPath(path, paintWave);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
