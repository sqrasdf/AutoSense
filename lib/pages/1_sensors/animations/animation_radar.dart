import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class RadarObject {
  final double angle;
  final double distance;
  final String imagePath;
  final bool isAsset;
  ui.Image? image;

  RadarObject(
    this.angle,
    this.distance,
    this.imagePath, {
    this.isAsset = false,
  });
}

class RadarWaveWidget extends StatefulWidget {
  const RadarWaveWidget({super.key});

  @override
  State<RadarWaveWidget> createState() => _RadarWaveWidgetState();
}

class _RadarWaveWidgetState extends State<RadarWaveWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<RadarObject> _objects = [
    RadarObject(
      0,
      0.7,
      // "https://toppng.com/uploads/preview/car-png-top-view-png-blue-car-top-view-11562875896ptd1ytjtjv.png",
      "assets/car1.png",
    ),
    RadarObject(
      -50,
      0.45,
      // "https://i.pinimg.com/1200x/4c/03/7f/4c037f9eebcc9e5b66863023999b11ae.jpg",
      "assets/car2.png",
    ),
    RadarObject(
      50,
      0.8,
      // "https://e7.pngegg.com/pngimages/978/928/png-clipart-red-sedan-car-door-car-seat-top-view-motor-vehicle-red-car-top-view-orange-car-seat-thumbnail.png",
      "assets/car3.png",
    ),
  ];

  final RadarObject _senderCar = RadarObject(
    0,
    0,
    // "https://cdn.vectorstock.com/i/1000v/97/42/car-top-view-icon-vehicle-vector-29309742.jpg",
    "assets/car4.png",
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _loadImages();
  }

  void _loadImages() {
    void loadOne(RadarObject obj) {
      ImageProvider provider;
      if (obj.isAsset || !obj.imagePath.toLowerCase().startsWith('http')) {
        provider = AssetImage(obj.imagePath);
      } else {
        provider = NetworkImage(obj.imagePath);
      }

      provider
          .resolve(ImageConfiguration.empty)
          .addListener(
            ImageStreamListener(
              (ImageInfo info, bool _) {
                if (mounted) {
                  setState(() {
                    obj.image = info.image;
                  });
                }
              },
              onError: (exception, stackTrace) {
                debugPrint(
                  "Błąd ładowania obrazka (${obj.imagePath}): $exception",
                );
              },
            ),
          );
    }

    for (var obj in _objects) {
      loadOne(obj);
    }
    loadOne(_senderCar);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: const Color.fromARGB(255, 246, 246, 246),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: RadarWavePainter(
              animationValue: _controller.value,
              objects: _objects,
              senderCar: _senderCar,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class RadarWavePainter extends CustomPainter {
  final double animationValue; // 0.0 -> 1.0
  final List<RadarObject> objects;
  final RadarObject senderCar;

  RadarWavePainter({
    required this.animationValue,
    required this.objects,
    required this.senderCar,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 20);
    final radius = size.height - 40;

    final paintGrid = Paint()
      ..color = const Color(0xFF00FF00).withAlpha(70)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final paintPulse = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final paintEcho = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final paintCarBody = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final paintCarGlass = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.fill;

    Offset getPos(double angleDeg, double r) {
      final rad = (angleDeg - 90) * (math.pi / 180);
      return center + Offset(r * math.cos(rad), r * math.sin(rad));
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      (-150) * (math.pi / 180),
      (120) * (math.pi / 180),
      false,
      paintGrid,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.66),
      (-150) * (math.pi / 180),
      (120) * (math.pi / 180),
      false,
      paintGrid,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.33),
      (-150) * (math.pi / 180),
      (120) * (math.pi / 180),
      false,
      paintGrid,
    );

    for (var obj in objects) {
      Offset pos = getPos(obj.angle, radius * obj.distance);

      if (obj.image != null) {
        canvas.save();
        canvas.translate(pos.dx, pos.dy);
        canvas.rotate((obj.angle) * (math.pi / 180));

        Rect dstRect = Rect.fromCenter(
          center: Offset.zero,
          width: obj.image!.width.toDouble() / 12,
          height: obj.image!.height.toDouble() / 12,
        );
        Rect srcRect = Rect.fromLTWH(
          0,
          0,
          obj.image!.width.toDouble(),
          obj.image!.height.toDouble(),
        );

        canvas.drawImageRect(obj.image!, srcRect, dstRect, Paint());
        canvas.restore();
      } else {
        canvas.save();
        canvas.translate(pos.dx, pos.dy);
        canvas.rotate((obj.angle) * (math.pi / 180));

        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset.zero, width: 24, height: 44),
            const Radius.circular(6),
          ),
          paintCarBody,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: const Offset(0, 0), width: 20, height: 26),
            const Radius.circular(3),
          ),
          paintCarGlass,
        );
        canvas.restore();
      }
    }

    for (int i = 0; i < 3; i++) {
      double waveProgress = (animationValue + (i * 0.33)) % 1.0;
      double currentR = radius * waveProgress;

      paintPulse.color = Colors.lightGreenAccent.withAlpha(
        ((1.0 - waveProgress) * 255).toInt(),
      );

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: currentR),
        (-150) * (math.pi / 180),
        (120) * (math.pi / 180),
        false,
        paintPulse,
      );

      for (var obj in objects) {
        double objDistIds = obj.distance; // Znormalizowany dystans (0..1)

        for (int k = 0; k <= 1; k++) {
          double effectiveProgress = waveProgress + k;

          if (effectiveProgress > objDistIds) {
            double timeSinceHit = effectiveProgress - objDistIds;
            double echoPosNormalized = objDistIds - timeSinceHit;

            if (echoPosNormalized > 0) {
              double echoR = radius * echoPosNormalized;

              paintEcho.color = Colors.redAccent.withAlpha(
                ((echoPosNormalized / objDistIds).clamp(0.2, 1.0) * 255)
                    .toInt(),
              );

              double startAngle = (obj.angle - 15 - 90) * (math.pi / 180);

              canvas.drawArc(
                Rect.fromCircle(center: center, radius: echoR),
                startAngle,
                (30) * (math.pi / 180),
                false,
                paintEcho,
              );
            }
          }
        }
      }
    }

    if (senderCar.image != null) {
      Rect dstRect = Rect.fromCenter(
        center: center + const Offset(0, 10),
        width: 50,
        height: 60,
      );
      Rect srcRect = Rect.fromLTWH(
        0,
        0,
        senderCar.image!.width.toDouble(),
        senderCar.image!.height.toDouble(),
      );
      canvas.drawImageRect(senderCar.image!, srcRect, dstRect, Paint());
    } else {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: center + const Offset(0, 10),
            width: 30,
            height: 50,
          ),
          const Radius.circular(5),
        ),
        Paint()..color = Colors.blueGrey,
      );
      canvas.drawPath(
        Path()
          ..moveTo(center.dx - 15, center.dy + 10)
          ..quadraticBezierTo(
            center.dx,
            center.dy - 5,
            center.dx + 15,
            center.dy + 10,
          ),
        Paint()
          ..color = Colors.lightBlueAccent.withAlpha(122)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
