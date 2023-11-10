import 'package:flutter/material.dart';

class BeTabBarIndicator extends Decoration {
  const BeTabBarIndicator(this.color);

  final Color color;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _TabBarIndicatorPainter(color);
}

class _TabBarIndicatorPainter extends BoxPainter {
  const _TabBarIndicatorPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const height = 3.0;
    const borderRadius = 8.0;

    final rect = Offset(
          offset.dx,
          configuration.size!.height - height,
        ) &
        Size(
          configuration.size!.width,
          height,
        );

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(borderRadius),
        topLeft: const Radius.circular(borderRadius),
      ),
      paint,
    );
  }
}
