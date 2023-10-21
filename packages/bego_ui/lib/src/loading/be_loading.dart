import 'package:flutter/material.dart';

class BeLoading extends StatelessWidget {
  const BeLoading({
    super.key,
    this.color,
    this.dimension = 24,
    this.strokeWidth = 4,
  });
  final Color? color;
  final double dimension;
  final double strokeWidth;
  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox.square(
          dimension: dimension,
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: strokeWidth,
          ),
        ),
      );
}
