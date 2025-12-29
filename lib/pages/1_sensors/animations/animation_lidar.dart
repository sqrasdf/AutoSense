import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:typed_data';

class _ScanPoint {
  final Offset position;
  final int objectId;
  final DateTime timestamp;

  _ScanPoint(this.position, this.objectId) : timestamp = DateTime.now();
}

class AnimationLidar extends StatefulWidget {
  const AnimationLidar({super.key});

  @override
  State<AnimationLidar> createState() => _AnimationLidarState();
}

class _AnimationLidarState extends State<AnimationLidar>
    with TickerProviderStateMixin {
  late AnimationController _lidarController;
  late AnimationController _objectController;

  final Map<int, _ScanPoint> _pointCloud = {};

  // static image - right
  ui.Image? _obstacleImage;
  ByteData? _obstaclePixels;

  // moving image - left
  ui.Image? _movingImage;
  ByteData? _movingPixels;

  // Obrazek środkowy (nadawca)
  ui.Image? _senderImage;

  @override
  void initState() {
    super.initState();

    _lidarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _objectController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _loadImages();
  }

  void _loadImages() {
    AssetImage("assets/car1.png")
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) async {
            final byteData = await info.image.toByteData(
              format: ui.ImageByteFormat.rawRgba,
            );
            if (mounted) {
              setState(() {
                _obstacleImage = info.image;
                _obstaclePixels = byteData;
              });
            }
          }, onError: (e, s) => debugPrint("Error loading car1: $e")),
        );

    AssetImage("assets/car4.png")
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) async {
            final byteData = await info.image.toByteData(
              format: ui.ImageByteFormat.rawRgba,
            );
            if (mounted) {
              setState(() {
                _movingImage = info.image;
                _movingPixels = byteData;
              });
            }
          }, onError: (e, s) => debugPrint("Error loading car4: $e")),
        );

    // Sender car
    AssetImage("assets/car2.png")
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) {
            if (mounted) {
              setState(() {
                _senderImage = info.image;
              });
            }
          }, onError: (e, s) => debugPrint("Error loading car2: $e")),
        );
  }

  @override
  void dispose() {
    _lidarController.dispose();
    _objectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      color: const Color(0xFF333333), // Ciemny asfalt
      child: AnimatedBuilder(
        animation: Listenable.merge([_lidarController, _objectController]),
        builder: (context, child) {
          double rotation = _lidarController.value * 2 * math.pi;
          double objProgress = _objectController.value;

          return CustomPaint(
            painter: _LidarImagePainter(
              rotation: rotation,
              objProgress: objProgress,
              pointCloud: _pointCloud,
              staticImage: _obstacleImage,
              staticPixels: _obstaclePixels,
              movingImage: _movingImage,
              movingPixels: _movingPixels,
              senderImage: _senderImage,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _LidarImagePainter extends CustomPainter {
  final double rotation;
  final double objProgress;
  final Map<int, _ScanPoint> pointCloud;

  final ui.Image? staticImage;
  final ByteData? staticPixels;

  final ui.Image? movingImage;
  final ByteData? movingPixels;

  final ui.Image? senderImage;

  _LidarImagePainter({
    required this.rotation,
    required this.objProgress,
    required this.pointCloud,
    this.staticImage,
    this.staticPixels,
    this.movingImage,
    this.movingPixels,
    this.senderImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRange = size.width * 0.55;
    final laneWidth = size.width / 3;

    // --- 0. RYSOWANIE PASÓW (DASHED LINES) ---
    final paintLine = Paint()
      ..color = Colors.white.withAlpha(200)
      ..style = PaintingStyle.fill;

    List<double> lineXOffsets = [-laneWidth / 2, laneWidth / 2];

    double dashHeight = 30.0;
    double gapHeight = 20.0;
    double totalDashPattern = dashHeight + gapHeight;

    // Przesunięcie animacji w dół (szybkie)
    double dyAnim = ((objProgress * 15) % 1.0) * totalDashPattern;

    double startY = -totalDashPattern;
    while (startY < size.height + totalDashPattern) {
      double y = startY + dyAnim;
      for (double xOff in lineXOffsets) {
        canvas.drawRect(
          Rect.fromCenter(
            center: center + Offset(xOff, y - size.height / 2),
            width: 4,
            height: dashHeight,
          ),
          paintLine,
        );
      }
      startY += totalDashPattern;
    }

    // --- 1. DEFINICJA PRZESZKÓD ---
    List<Rect> boxes = [];
    List<Offset> centers = [];

    // A. Animowany (ID 0) - Lewy Pas
    double animY = 250.0 - (objProgress * 500.0);
    Offset animCenter = Offset(-laneWidth * 0.85, animY);
    double movW = 70.0;
    double movH = 90.0;
    Rect animRect = Rect.fromCenter(
      center: animCenter,
      width: movW,
      height: movH,
    );

    boxes.add(animRect);
    centers.add(animCenter);

    // B. Statyczny (ID 1) - Prawy Pas
    double carX = laneWidth;
    double carY = -50;
    double staW = 40;
    double staH = 80;
    Rect staticRect = Rect.fromCenter(
      center: Offset(carX, carY),
      width: staW,
      height: staH,
    );

    boxes.add(staticRect);
    centers.add(Offset(carX, carY));

    final paintRay = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final paintPlaceholder = Paint()
      ..color = Colors.grey.withAlpha(122)
      ..style = PaintingStyle.stroke;

    void drawCar(int id, Rect rectInLocal, ui.Image? img) {
      Rect dst = rectInLocal.translate(center.dx, center.dy);
      if (img != null) {
        canvas.drawImageRect(
          img,
          Rect.fromLTWH(0, 0, img.width.toDouble(), img.height.toDouble()),
          dst,
          Paint(),
        );
      } else {
        canvas.drawRect(dst, paintPlaceholder);
      }
    }

    drawCar(0, animRect, movingImage);
    drawCar(1, staticRect, staticImage);

    // --- 3. RAY CASTING ---
    int raysCount = 120;
    double fov = 30 * (math.pi / 180);

    double? checkCollision(
      int id,
      Rect localRect,
      Offset rayStart,
      Offset dir,
      double currentBestT,
    ) {
      Rect absRect = localRect.translate(center.dx, center.dy);
      ui.Image? img = (id == 0) ? movingImage : staticImage;
      ByteData? pix = (id == 0) ? movingPixels : staticPixels;

      List<Offset> corners = [
        absRect.topLeft,
        absRect.topRight,
        absRect.bottomRight,
        absRect.bottomLeft,
      ];
      double? enterT, exitT;

      for (int k = 0; k < 4; k++) {
        Offset p1 = corners[k];
        Offset p2 = corners[(k + 1) % 4];
        Offset? intersection = _getLineIntersection(
          rayStart,
          rayStart + dir * maxRange,
          p1,
          p2,
        );
        if (intersection != null) {
          double t = (intersection - rayStart).distance;
          if (enterT == null || t < enterT) enterT = t;
          if (exitT == null || t > exitT) exitT = t;
        }
      }
      if (absRect.contains(rayStart)) enterT = 0.0;

      if (enterT == null) return null;
      if (enterT > currentBestT) return null;

      if (img == null || pix == null) {
        return enterT;
      }

      double actualExit = exitT ?? maxRange;
      if (actualExit > currentBestT) actualExit = currentBestT;

      double scaleX = img.width / absRect.width;
      double scaleY = img.height / absRect.height;
      double maxScale = math.max(scaleX, scaleY);

      double step = 1.0;
      if (maxScale > 0) {
        step = 1.0 / maxScale;
        step *= 0.8;
      }

      if (step > 1.0) step = 1.0;
      if (step < 0.02) step = 0.02;

      double dist = enterT;

      while (dist <= actualExit) {
        Offset p = rayStart + dir * dist;

        double u = (p.dx - absRect.left) / absRect.width;
        double v = (p.dy - absRect.top) / absRect.height;

        if (u >= 0 && u < 1 && v >= 0 && v < 1) {
          int imgX = (u * img.width).floor().clamp(0, img.width - 1);
          int imgY = (v * img.height).floor().clamp(0, img.height - 1);

          int pixelIndex = (imgY * img.width + imgX) * 4;
          if (pixelIndex + 3 < pix.lengthInBytes) {
            int alpha = pix.getUint8(pixelIndex + 3);
            if (alpha > 1) {
              return dist;
            }
          }
        }
        dist += step;
      }

      return null;
    }

    for (int i = 0; i < raysCount; i++) {
      double angle = rotation - (fov / 2) + (fov * i / raysCount);
      Offset dir = Offset(math.cos(angle), math.sin(angle));

      double bestT = maxRange;
      bool hit = false;
      int hitObjectId = -1;

      for (int id = 0; id < 2; id++) {
        double? t = checkCollision(id, boxes[id], center, dir, bestT);
        if (t != null && t < bestT) {
          bestT = t;
          hit = true;
          hitObjectId = id;
        }
      }

      Offset endPos = center + dir * bestT;
      canvas.drawLine(center, endPos, paintRay);

      int angleDeg = (angle * 180 / math.pi).round() % 360;
      if (angleDeg < 0) angleDeg += 360;

      if (hit && bestT < maxRange) {
        if (hitObjectId == 0) {
          Offset objC = center + centers[0];
          pointCloud[angleDeg] = _ScanPoint(endPos - objC, 0);
        } else {
          pointCloud[angleDeg] = _ScanPoint(endPos, -1);
        }
      } else {
        pointCloud.remove(angleDeg);
      }
    }

    final paintCloud = Paint()
      // ..color = Colors.orange
      ..color = Color(0xFFFFFF66)
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final now = DateTime.now();
    pointCloud.removeWhere(
      (_, pt) => now.difference(pt.timestamp).inMilliseconds > 1000,
    );

    List<Offset> pointsToDraw = [];
    for (var pt in pointCloud.values) {
      if (pt.objectId == 0) {
        Offset currentObjC = center + centers[0];
        pointsToDraw.add(currentObjC + pt.position);
      } else {
        pointsToDraw.add(pt.position);
      }
    }
    canvas.drawPoints(ui.PointMode.points, pointsToDraw, paintCloud);

    // Sender Car (Center)
    if (senderImage != null) {
      double sW = 60;
      double sH = 80;
      Rect senderRect = Rect.fromCenter(center: center, width: sW, height: sH);
      canvas.drawImageRect(
        senderImage!,
        Rect.fromLTWH(
          0,
          0,
          senderImage!.width.toDouble(),
          senderImage!.height.toDouble(),
        ),
        senderRect,
        Paint(),
      );
    } else {
      canvas.drawRect(
        Rect.fromCenter(center: center, width: 20, height: 36),
        Paint()..color = Colors.blueGrey,
      );
    }
  }

  Offset? _getLineIntersection(Offset p1, Offset p2, Offset p3, Offset p4) {
    double x1 = p1.dx, y1 = p1.dy, x2 = p2.dx, y2 = p2.dy;
    double x3 = p3.dx, y3 = p3.dy, x4 = p4.dx, y4 = p4.dy;
    double den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if (den == 0) return null;
    double t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
    double u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
    if (t >= 0 && t <= 1 && u >= 0 && u <= 1) {
      return Offset(x1 + t * (x2 - x1), y1 + t * (y2 - y1));
    }
    return null;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
