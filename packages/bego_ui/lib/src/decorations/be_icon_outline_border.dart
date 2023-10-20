import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

class BeIconOutlinedBorder extends OutlinedBorder {
  const BeIconOutlinedBorder({
    required this.iconData,
    this.iconSize = 24.0,
    this.roundRadius = 4.0,
    this.borderColor = BegoColors.primary,
  });
  final IconData iconData;
  final double iconSize;
  final Color borderColor;
  final double roundRadius;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(iconSize);

  @override
  OutlinedBorder scale(double t) => BeIconOutlinedBorder(
        iconData: iconData,
        iconSize: iconSize,
        borderColor: borderColor,
      );

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      Path(); // Not needed for this example

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final center = rect.center;
    final iconHalfSize = iconSize / 2;
    final iconRect = Rect.fromCenter(
      center: center,
      width: iconHalfSize,
      height: iconHalfSize,
    );

    final path = Path()
      ..addOval(iconRect)
      ..addOval(rect);

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawRRect(
      RRect.fromRectXY(rect, roundRadius, roundRadius),
      paint,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          color: borderColor,
          fontSize: iconSize,
          fontFamily: iconData.fontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: iconSize);
    final textCenter = Offset(
      rect.center.dx - textPainter.width / 2,
      rect.center.dy - textPainter.height / 2,
    );
    textPainter.paint(canvas, textCenter);
  }

  @override
  BeIconOutlinedBorder copyWith({BorderSide? side}) => BeIconOutlinedBorder(
        iconData: iconData,
        iconSize: iconSize,
        borderColor: borderColor,
        roundRadius: roundRadius,
      );
}
