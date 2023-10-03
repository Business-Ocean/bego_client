import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

/// Description: Dotted dividing line in custom interface elements
///
/// Applicable scene
/// 1. Dividing lines in interface elements
///
/// 2. Decoration of dividing line style

/// The location of the dividing line
enum BeDashedLinePosition {
  /// Head
  trailing,

  /// Tail
  leading,
}

///Default dotted line direction
const Axis _normalAxis = Axis.horizontal;

///Default dash length
const double _normalDashedLength = 8;

///Default dotted line thickness
const double _normalDashedThickness = 1;

///Default spacing
const double _normalDashedSpacing = 4;

/// Default position, head
const BeDashedLinePosition _normalPosition = BeDashedLinePosition.leading;

/// Dotted dividing line
class BeDashedLine extends StatelessWidget {
  const BeDashedLine({
    super.key,
    required this.contentWidget,
    this.axis = _normalAxis,
    this.dashedLength = _normalDashedLength,
    this.dashedThickness = _normalDashedThickness,
    this.dashedSpacing = _normalDashedSpacing,
    this.color = BegoColors.gray300,
    this.dashedOffset = 0.0,
    this.position = _normalPosition,
  });

  /// Dashed line direction, default value [_normalAxis]
  final Axis axis;

  /// Dashed line length, default value [_normalDashedLength]
  final double dashedLength;

  /// Dashed line thickness, default value [_normalDashedThickness]
  final double dashedThickness;

  /// Dashed line spacing, default value [_normalDashedSpacing]
  final double dashedSpacing;

  /// Color, default value [BegoColors.gray300]
  final Color color;

  /// Dotted Widget
  final Widget contentWidget;

  /// The position (offset) from the edge, the default value is 0
  final double dashedOffset;

  /// The position of the dividing line, default value [_normalPosition]
  final BeDashedLinePosition position;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: BeDashedPainter(
          axis: axis,
          dashedLength: dashedLength,
          dashedThickness: dashedThickness,
          dashedSpacing: dashedSpacing,
          color: color,
          dashedOffset: dashedOffset,
          position: position,
        ),
        child: contentWidget,
      );
}

class BeDashedPainter extends CustomPainter {
  BeDashedPainter({
    this.axis = _normalAxis,
    this.dashedLength = _normalDashedLength,
    this.dashedThickness = _normalDashedThickness,
    this.dashedSpacing = _normalDashedSpacing,
    this.color = BegoColors.gray300,
    this.dashedOffset = 0.0,
    this.position = _normalPosition,
  });

  /// Dashed line direction
  final Axis axis;

  /// Dashed line length
  final double dashedLength;

  /// Dotted line thickness
  final double dashedThickness;

  /// Dotted line spacing
  final double dashedSpacing;

  /// color
  final Color color;

  /// Position from edge
  final double? dashedOffset;

  /// The location of the dividing line
  final BeDashedLinePosition? position;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint() // Create a brush and configure its properties
      ..strokeWidth = dashedThickness // The width of the brush
      ..isAntiAlias = true // Whether to anti-alias
      ..color = color; // Brush color

    final maxWidth = size.width; // size gets the width
    final maxHeight = size.height; // size gets the width
    if (axis == Axis.horizontal) {
      // horizontal direction
      var startX = 0.0;
      final space = dashedSpacing + dashedLength;
      var height = 0.0;
      if (position == BeDashedLinePosition.leading) {
        //head
        height = dashedOffset! + dashedThickness / 2;
      } else {
        // tail
        height = size.height - dashedOffset! - dashedThickness / 2;
      }
      while (startX < maxWidth) {
        if ((maxWidth - startX) < dashedLength) {
          canvas.drawLine(
            Offset(startX, height),
            Offset(startX + (maxWidth - startX), height),
            paint,
          );
        } else {
          canvas.drawLine(
            Offset(startX, height),
            Offset(startX + dashedLength, height),
            paint,
          );
        }
        startX += space as int;
      }
    } else {
      // vertical direction
      var startY = 0.0;
      final space = dashedSpacing + dashedLength;
      var width = 0.0;
      if (position == BeDashedLinePosition.leading) {
        //head
        width = dashedOffset! + dashedThickness / 2;
      } else {
        // tail
        width = size.width - dashedOffset! - dashedThickness / 2;
      }
      while (startY < maxHeight) {
        if ((maxHeight - startY) < dashedLength) {
          canvas.drawLine(
            Offset(width, startY),
            Offset(width, startY + (maxHeight - startY)),
            paint,
          );
        } else {
          canvas.drawLine(
            Offset(width, startY),
            Offset(width, startY + dashedLength),
            paint,
          );
        }
        startY += space as int;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
