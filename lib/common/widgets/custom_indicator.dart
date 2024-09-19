import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:stardust_app_skeleton/utils/constants/colors.dart';

// Define a custom star shape border
class StarShapeBorder extends ShapeBorder {
  final double size;

  const StarShapeBorder({
    this.size = 8.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(size);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final radius = size / 2;
    final innerRadius = radius * 0.3; // Inner radius of the star

    // Define a star shape based on SVG
    final double centerX = radius;
    final double centerY = radius;
    const double angle =
        2 * 3.141592653589793 / 8; // 360 degrees divided by 5 points

    for (int i = 0; i < 8; i++) {
      final double r = (i % 2 == 0) ? radius : innerRadius;
      final double x = centerX + r * cos(i * angle - 3.141592653589793 / 2);
      final double y = centerY + r * sin(i * angle - 3.141592653589793 / 2);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = getInnerPath(rect, textDirection: textDirection);
    return path.shift(rect.topLeft);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    final path = getInnerPath(rect, textDirection: textDirection);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return StarShapeBorder(size: size * t);
  }
}

class StarDotsIndicator extends StatelessWidget {
  final int pageLength;
  final int currentIndexPage;

  const StarDotsIndicator({
    super.key,
    required this.pageLength,
    required this.currentIndexPage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: StarColors.bgLight.withOpacity(0.2),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: DotsIndicator(
                  dotsCount: pageLength,
                  position: currentIndexPage.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size(16.0, 16.0),
                    activeSize: const Size(24.0, 24.0),
                    shapes: List.generate(
                      pageLength,
                      (index) => const StarShapeBorder(size: 12.0),
                    ),
                    activeShapes: List.generate(
                      pageLength,
                      (index) => const StarShapeBorder(size: 18.0),
                    ),
                    activeColor: StarColors.starPink,
                    color: StarColors.placeholder,
                    spacing: const EdgeInsets.symmetric(horizontal: 5.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
