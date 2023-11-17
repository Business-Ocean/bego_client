import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    this.headingColor,
    this.tagColor,
    this.headingSize = 42,
    this.tagSize = 12,
  });

  final Color? headingColor;
  final Color? tagColor;
  final double headingSize;
  final double tagSize;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          BeText(
            'BEGO',
            padding: EdgeInsets.zero,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: headingSize,
              height: 1,
              color: headingColor,
            ),
          ),
          BeText(
            'Discover Nearby Seamlessly',
            padding: const EdgeInsets.only(left: 4),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: tagSize,
              color: tagColor,
              letterSpacing: 0.6,

              // height: 0.01,
            ),
          ),
        ],
      );
}
