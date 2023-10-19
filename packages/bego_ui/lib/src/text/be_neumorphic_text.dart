import 'package:flutter/material.dart';

class BeNeumorphicText extends StatelessWidget {
  const BeNeumorphicText({
    super.key,
    required this.text,
    this.elevation = 3,
  });

  final double elevation;
  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade50,
          shadows: [
            Shadow(
              color: Colors.grey.shade300,
              offset: const Offset(3.0, 3.0),
              blurRadius: elevation,
            ),
            Shadow(
              color: Colors.white,
              offset: const Offset(-3.0, 3.0),
              blurRadius: elevation,
            ),
          ],
        ),
      );
}
